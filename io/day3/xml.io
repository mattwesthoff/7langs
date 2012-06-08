Builder := Object clone do ( depth ::= 0)
Builder output := method(d, s, writeln("\t" repeated(d), s))
Builder forward := method(
    output(depth, "<"..(call message name)..">")
    setDepth(depth + 1)
    call message arguments foreach(arg,
        content := self doMessage(arg)
        if (content type == "Sequence", output(depth, content)))
    setDepth(depth - 1)
    output(depth, "</"..(call message name)..">")
)

Builder ul(li("IO"),li("LUA"),li("JS"))
