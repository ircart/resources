# IRC Art

The term "IRC Art" is used to refer to text based visual art found on IRC. The art found on IRC has evolved past using just ASCII charcters. IRC clients today understand a number of special formatting characters. These characters allow IRC software to send and receive colors and formatting codes such as bold, italics, underline and others. This allows more possibilites now for creating ASCII/ANSI art for IRC. While it is possible to have support for 99 or even 256 colors, most art made for IRC follows the 16 color standard.

## Table of Contents
- [Setup](#setup)
  - [Linux](#linux)
  - [Client](#client)
- [Resources](#resources)
  - [Art Packs](#art-packs)
  - [Convert](#convert)
  - [Drawing](#drawing)
    - [Software](#software)
    - [Web Based](#web-based)
  - [Other](#other)
- [Websites](#websites)
- [IRC Channels](#irc-channels)

***

### Setup
In order to properly execute playing art in an IRC channel, it is generally agreed that you want to pump the art as quickly as possible. That means, any client or server side throttling can make pumping large art heavily delayed or interrepted. You also want to make sure you have full support for viewing UTF-8 unicode characters.

#### Linux
Execute the following commands:
```
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
```

Place the following lines in your ~/.bashrc file:
```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
```

Now just run `source ~/.bashrc` to make the changes take affect.

If you are using [GNU screen](https://www.gnu.org/software/screen/), make sure that `defutf8 on` is in your ~/.screenrc file.

#### Client
<details>
   <summary>IRSSI</summary>
  
##### UTF-8
```
/set term_charset utf-8
/set recode_autodetect_utf8 ON
/set recode_fallback ISO-8859-15
/set recode_out_default_charset ISO-8859-15
/set recode_transliterate ON
/set recode ON
```

##### Flooding
###### Global
```
/set cmd_queue_speed 0msec
/set cmds_max_at_once 0
```

###### Network Specific
```
/network add -cmdmax 0 -cmdspeed 0msec <network_name>
```
</details>

<details>
   <summary>HexChat/xChat</summary>
  
##### UTF-8
Edit your network and change "Character set" to "UTF-8 (Unicode)" for all of your networks.

##### Font
Navigate to Settings->Preferences->Interface->Text box and set the font to monospace normal size 9.

##### Colors
Locate your colors.conf file in either the AppData (Windows) or ~/.xchat2 (Linux) directory and replace the first 16 lines with the follow:
```
color_0 = ffff ffff ffff
color_1 = 0000 0000 0000
color_2 = 0000 0000 7f7f
color_3 = 0000 9393 0000
color_4 = ffff 0000 0000
color_5 = 7f7f 0000 0000
color_6 = 9c9c 0000 9c9c
color_7 = fcfc 7f7f 0000
color_8 = ffff ffff 0000
color_9 = 0101 fcfc 0000
color_10 = 0000 9393 9393
color_11 = 0101 ffff ffff
color_12 = 0000 0000 fcfc
color_13 = ffff 0000 ffff
color_14 = 7f7f 7f7f 7f7f
color_15 = d2d2 d2d2 d2d2
```

##### Flooding
```
/set net_throttle 0
```

#####

</details>

<details>
   <summary>WeeChat</summary>
  
##### UTF-8
UTF-8 is enabled by default on Weechat.

##### Flooding
###### Global
```
/set irc.server_default.anti_flood_prio_high 0
/set irc.server_default.anti_flood_prio_low 0
```

###### Network Specific
```
/set irc.server.<network_name>.anti_flood_prio_high 0
/set irc.server.<network_name>.anti_flood_prio_low 0
```

**Note:** Change 0 to 2 for safe flood rates on networks like EFNet.
</details>

***

### Resources
#### Art Packs

###### ANSI Art Packs
| Pack | Description |
| ---- | ----------- |
| [Blocktronics](https://github.com/blocktronics/artpacks) | Archive of ANSI art from [blocktronics](http://blocktronics.org/) |
| [SixteenColors](https://github.com/sixteencolors/sixteencolors-archive) | Archive of ANSI art from [sixteencolors](http://sixteencolors.net/) |

**Note:** These will not work on IRC unless they are converted into IRC art! *(see [Tools/Convert](#convert))*

###### IRC Art Packs
| Pack | Description |
| ---- | ----------- |
| [IRCArt](https://github.com/ircart/ircart) | Massive collection of organized IRC art |
| [MiRCART](https://mircart.org/?page_id=1882) | Art pack made by the [MiRCART](https://mircart.org/) crew |
| [PP4L](http://wepump.in/ascii/) | Art pack made by the [PP4L](http://wepump.in/) crew |
| [TrollASCII](https://github.com/jakkm3n/trollascii) | Giant mess of unorganized art |
| [Volatile](https://git.volatile.bz/cgit/wowaname/ascii-art/) | Art pack containing other packs & some OC by [volatile](https://volatile.bz/) |

**Note:** The [IRCArt](https://github.com/ircart/ircart) repository listed above contains all the art from the other packs, has been heavily organized, and is constantly being updated with new art.

#### Convert
| Name | Description |
| ---- | ----------- |
| [a2m](https://git.trollforge.org/a2m/) | Convert ANSI art to IRC art |
| [p2u](https://git.trollforge.org/p2u/) | Convertt images to ANSI/IRC art |
| [irc2html](https://ircart.github.io/irc2html/) | Convert IRC art to HTML |
| [img2term](https://github.com/wwared/img2term) | Output images in your terminal |
| [RuinIRC99](https://ruinirc99.firebaseapp.com/) | Convert images to IRC art from your browser |

#### Drawing
###### Software
| Name | Description |
| ---- | ----------- |
| [ACiDDraw](http://www.acid.org/apps/apps.html) | Old school ANSI art drawing tool |
| [asciipumper](https://github.com/ircart/asciipumper) | MS-Paint style program to draw IRC art *(archived)* |
| [IRC-Paint](https://github.com/wwared/IRC-Paint) | MS-Paint style program to draw IRC art *(archived)* |
| [PabloDraw](http://picoe.ca/products/pablodraw/) | Old school ANSI art drawing tool |

###### Web Based
| Name | Description |
| ---- | ----------- |
| [asciiblaster](https://asdf.us/asciiblaster/) | Draw IRC/ANSI art from your browser |
| [asciimaker](https://ircart.github.io/asciimaker/)| Draw IRC art from your browser |
| [bashfill](https://max.io/bash.html)| Draw art for your terminal |

#### Other
| Name | Description |
| ---- | ----------- |
| [Limnoria ASCII Plugins](https://github.com/oddluck/limnoria-plugins/tree/master/ASCII) | ASCII plugins for [Limnoria](https://github.com/ProgVal/Limnoria) |
| [MiRCARTools](https://github.com/lalbornoz/MiRCARTools) | IRC art editor & tools |
| [Scroll](https://github.com/ircart/scroll) | Very functional IRC bot to play art & more |
| [TDFiglet](https://git.trollforge.org/tdfiglet/) | Convert text to [TheDraw](https://www.roysac.com/thedrawfonts-tdf.html) ANSI fonts |

***

### Websites
- [BlockTronics](http://blocktronics.org/)
- [MiRCART](https://mircart.org/)
- [PP4L](http://wepump.in/)
- [SixteenColors](https://16colo.rs/)

***

### IRC Channels
| Channel | Network |
| ------- | ------- |
| **##ascii** | [Freenode](https://freenode.net/) |
| **#ascii** | [EFNet](http://efnet.org/) |
| **#mircart** | [EFNet](http://efnet.org/) |
| **#scroll** | [SuperNETs](https://supernets.org/) |
