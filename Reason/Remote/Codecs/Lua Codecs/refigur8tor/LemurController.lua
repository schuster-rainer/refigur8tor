function remote_init(manufacturer, model)
    items={
        {name="Rotary1", input="value",output="value", min=0, max=127},
        {name="Rotary2", input="value",output="value", min=0, max=127},
        {name="Rotary3", input="value",output="value", min=0, max=127},
        {name="Rotary4", input="value",output="value", min=0, max=127},
        {name="ModWheel", input="value",output="value", min=0, max=127},
        {name="Button1", input="value",output="value", min=0, max=127},
        {name="Button2", input="value",output="value", min=0, max=127},
        {name="Button3", input="value",output="value", min=0, max=127},
        {name="Button4", input="value",output="value", min=0, max=127},
    }
    remote.define_items(items)

    local inputs={
        {pattern="b?  01  xx", name="ModWheel"},
        {pattern="b?  47  xx", name="Rotary1"},
        {pattern="b?  48  xx", name="Rotary2"},
        {pattern="b?  49  xx", name="Rotary3"},
        {pattern="b?  4A  xx", name="Rotary4"},
        {pattern="b?  4B  xx", name="Button1"},
        {pattern="b?  4C  xx", name="Button2"},
        {pattern="b?  4D  xx", name="Button3"},
        {pattern="b?  4E  xx", name="Button4"},
    }
    remote.define_auto_inputs(inputs)

    local outputs={
        {pattern="b?  01  xx", name="ModWheel"},
        {pattern="b?  47  xx", name="Rotary1"},
        {pattern="b?  48  xx", name="Rotary2"},
        {pattern="b?  49  xx", name="Rotary3"},
        {pattern="b?  4A  xx", name="Rotary4"},
        {pattern="b?  4B  xx", name="Button1"},
        {pattern="b?  4C  xx", name="Button2"},
        {pattern="b?  4D  xx", name="Button3"},
        {pattern="b?  4E  xx", name="Button4"},
    }
    remote.define_auto_outputs(outputs)
end

