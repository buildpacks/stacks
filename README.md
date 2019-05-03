# Stacks

## Development

To create bionic stack images run:
```
./scipts/create-stack.sh [ -v <version>]
```
This will generate `packs/build:<version>` and `packs/run:<version>` images

To use this stack see the `pack create-builder` [documentation](https://github.com/buildpack/pack/blob/master/README.md#working-with-builders-using-create-builder)