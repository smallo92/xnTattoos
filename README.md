# **xnTattoos | QBCore Version**

QBCore Tattoo Shop using all the available GTA Online tattoos with correct names and configured pricing. You can select parts of the body and apply multiple tattoos to each area, change the opacity of the tattoos, rotate the camera to see them from multiple angles and even remove tattoos. 

## **Installation**

- Run tattoos.sql

- Add `ensure xnTattoos` to your server.cfg


## **Dependencies**

- [QBCore](https://github.com/qbcore-framework) 
- [Oxmysql](https://github.com/overextended/oxmysql)
- `JayMenu` by [Jaymo](https://github.com/jaymo1011) (which is currently included in this release until it is actually fully released)


## **Customisation**

All the tattoos are stored in the `AllTattoos.json` file, these are ripped directly from GTA5 thanks to [root-cause](https://github.com/root-cause) and  [ihyajb](https://github.com/ihyajb)

The prices of the tattoos are being divided by 20 otherwise they would all be massively expensive, so if you plan to change the prices keep that in mind unless you plan to change the script itself

All tattoo names are stored text labels inside the game, so if you plan to add custom tattoos make sure it has a matching label being created with `AddTextEntry()`

Categories are defined by the `Zone` entry in the json and the DLC they come from is defined by `Collection` which is used to load the correct textures

## **Known Issues**

Sometime the camera goes into the wrong spot. Leave the menu and re-enter it to fix that.

Head Blend Data is memed on OneSync so the tattoos try and reapply themselves every 5 minutes to counter that (maybe)
