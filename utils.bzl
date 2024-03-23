def list_source_directories(directories, exclude_pattern):
    srcs = native.glob([directories + "/**/*.c"], exclude = [exclude_pattern])
    return srcs

def _print_list_impl(ctx):
    output = ctx.outputs.out
    srcs = ctx.attr.srcs
    content = ""
    for src in srcs:
        content += src + "\n"
    ctx.actions.write(output=output, content=content)

print_list = rule(
    implementation = _print_list_impl,
    attrs = {
        "srcs": attr.string_list(mandatory=True),
        "out": attr.output(mandatory=True),
    }
)
