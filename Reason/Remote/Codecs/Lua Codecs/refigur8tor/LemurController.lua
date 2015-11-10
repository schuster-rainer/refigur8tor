function remote_init(manufacturer, model)
    items={
        {name="Rotary 1", input="value",output="value", min=0, max=127},
        {name="Rotary 2", input="value",output="value", min=0, max=127},
        {name="Rotary 3", input="value",output="value", min=0, max=127},
        {name="Rotary 4", input="value",output="value", min=0, max=127},

        {name="Button 1", input="value",output="value", min=0, max=127},
        {name="Button 2", input="value",output="value", min=0, max=127},
        {name="Button 3", input="value",output="value", min=0, max=127},
        {name="Button 4", input="value",output="value", min=0, max=127},

        {name="Keyboard", input="keyboard"},
        {name="Mod Wheel", input="value",output="value", min=0, max=127},
        {name="Pitch Bend", input="value", min=0, max=16383},
        {name="Channel Pressure", input="value", min=0, max=127},
        {name="Expression", input="value", min=0, max=127},
        {name="Damper Pedal", input="value", min=0, max=127},

        {name="Rewind", input="button"},
        {name="Fast Forward", input="button"},
        {name="Stop", input="button"},
        {name="Play", input="button"},
        {name="Record", input="button"},
    }
    remote.define_items(items)

    local inputs={
        {pattern="b? 47 xx", name="Rotary 1"},
        {pattern="b? 48 xx", name="Rotary 2"},
        {pattern="b? 49 xx", name="Rotary 3"},
        {pattern="b? 4A xx", name="Rotary 4"},

        {pattern="b? 4B xx", name="Button 1"},
        {pattern="b? 4C xx", name="Button 2"},
        {pattern="b? 4D xx", name="Button 3"},
        {pattern="b? 4E xx", name="Button 4"},

        {pattern="b? 01 xx", name="Mod Wheel"},
        {pattern="e? xx yy", name="Pitch Bend", value="y*128 + x"},
        {pattern="b? 0b xx", name="Expression"},
        {pattern="b? 40 xx", name="Damper Pedal"},
        {pattern="d? xx", name="Channel Pressure"},

        {pattern="F0 7F 7F 06 01 F7", name="Stop", value="1"},
        {pattern="F0 7F 7F 06 02 F7", name="Play", value="1"},
        {pattern="F0 7F 7F 06 04 F7", name="Fast Forward", value="1"},
        {pattern="F0 7F 7F 06 05 F7", name="Rewind", value="1"},
        {pattern="F0 7F 7F 06 06 F7", name="Record", value="1"},
    }
    remote.define_auto_inputs(inputs)

    local outputs={
        {pattern="b?  01  xx", name="Mod Wheel"},
        {pattern="b?  47  xx", name="Rotary 1"},
        {pattern="b?  48  xx", name="Rotary 2"},
        {pattern="b?  49  xx", name="Rotary 3"},
        {pattern="b?  4A  xx", name="Rotary 4"},
        {pattern="b?  4B  xx", name="Button 1"},
        {pattern="b?  4C  xx", name="Button 2"},
        {pattern="b?  4D  xx", name="Button 3"},
        {pattern="b?  4E  xx", name="Button 4"},
    }
    remote.define_auto_outputs(outputs)
end

