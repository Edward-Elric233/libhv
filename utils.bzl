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

def _get_headers_impl(ctx):
    hdrs = ctx.attr.hdrs
    output = ["include/hv/" + hdr.split("/")[-1] for hdr in hdrs]
        

get_headers = rule(
    implementation = _get_headers_impl,
    attrs = {
        "hdrs": attr.string_list(mandatory=True),
    }
)
