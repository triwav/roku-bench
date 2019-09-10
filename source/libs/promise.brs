function createTaskPromise(taskName as string, fields = Invalid as object, returnSignalFieldValue = false as boolean, signalField = "output" as string) as object
    task = CreateObject("roSGNode", taskName)
    if fields <> Invalid then task.setFields(fields)
    promise = __createPromiseFromNode(task, signalField, returnSignalFieldValue)
    task.control = "run"
    return promise
end function

function createObservablePromise(signalFieldType = "assocarray" as string, fields = Invalid as object, returnSignalFieldValue = false as boolean, signalField = "output" as string) as object
    node = CreateObject("roSGNode", "Node")
    if fields <> Invalid then node.addFields(fields)
    node.addField(signalField, signalFieldType, false)
    promise = __createPromiseFromNode(node, signalField, returnSignalFieldValue)
    return promise
end function

function createManualPromise() as object
    promise = __createPromise()
    promise.resolve = sub(value)
        m.context[m.id + "_callback"](value)
        m.complete = true
    end sub
    return promise
end function

function createOnAnimationCompletePromise(animation as object, startAnimation = true as boolean, unparentNode = true as boolean) as object
    promise = __createPromiseFromNode(animation, "state")
    promise.shouldSendCallback = function(node) as Boolean
        if node.state = "stopped" then return true
        return false
    end function
    promise.unparent = unparentNode

    if startAnimation then animation.control = "start"
    return promise
end function


'---------------------------------------------------------------------
' Everything below here is private and should not be called directly.
'---------------------------------------------------------------------
function __createPromiseFromNode(node as object, signalField as string, returnSignalFieldValue = false as boolean) as object
    promise = __createPromise()
    node.id = promise.id
    node.observeFieldScoped(signalField, "__nodePromiseResolvedHandler")
    promise.signalField = signalField
    promise.node = node
    promise.returnSignalFieldValue = returnSignalFieldValue
    return promise
end function

function __createPromise() as object
    id = StrI(rnd(2147483647), 36)
    promise = {
        "then": function(callback as function) as object
            m.context[m.id + "_callback"] = callback
            return m
        end function

        "dispose": sub()
            if m.complete = true then return
            m.context.delete(m.id + "_callback")
            m.context.delete(m.id)
            if m.node <> Invalid then m.node.unobserveFieldScoped(m.signalField)
            m.delete("context")
            m.delete("node")
        end sub
    }
    promise.context = m
    promise.id = id
    promise.complete = false
    m[id] = promise
    return promise
end function

sub __nodePromiseResolvedHandler(e as object)
    id = e.getNode()
    promise = m[id]

    isFunc = function (value)
        valueType = type(value)
        return (valueType = "roFunction") or (valueType = "Function")
    end function

    if isFunc(promise.shouldSendCallback) and promise.shouldSendCallback(node) = false then return

    callback = promise.context[id + "_callback"]
    if isFunc(callback) then
        if promise.returnSignalFieldValue = true then
            callback(e.getData())
        else
            callback(promise.node)
        end if
    end if

    'clean up properly properly
    if promise.suppressDispose = Invalid then
        promise.dispose()
    end if

    promise.complete = true

    if promise.unparent = true then
        parent = node.getParent()
        if parent <> Invalid then parent.removeChild(node)
    end if
end sub
