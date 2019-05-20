ARG base_image

FROM ${base_image}
ARG stack_id="io.buildpacks.stacks.bionic"

EXPOSE 8080

USER cnb

LABEL io.buildpacks.stack.id="${stack_id}"

ENTRYPOINT ["/lifecycle/launcher"]
