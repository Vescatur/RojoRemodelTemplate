# Rojo Remodel Template
This template is based on the Rojo template and https://devforum.community/t/what-is-your-fully-managed-rojo-workflow/420/3. I added scripts to extract the Models from assets/Models.rbxl file. The remodel script is activated each time assets/Models.rbxl is saved. This template only works for Windows.


## Getting Started
To build the place from scratch, use:

```bash
rojo build -o "RojoTest.rbxlx"
```

Next, open `RojoTest.rbxlx` in Roblox Studio and start the Rojo server:

```bash
rojo serve
```

```bash
rojo serve
```

To extract the models, run:

```bash
remodel run assets/PullAssets.lua
```

For more help, check out [the Rojo documentation](https://rojo.space/docs).