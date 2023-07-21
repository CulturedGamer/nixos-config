{ config, pkgs, ... }:

{
    home.file = {
        ".config/qtile/config.py".text = ''
            from libqtile import bar, layout, widget
            from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
            from libqtile.lazy import lazy

            mod = "mod4"
            terminal = "alacritty" 

            keys = [
                Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
                Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
                Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
                Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
                Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
                Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
                Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
                Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
                Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
                Key([mod, "control"], "h", lazy.layout.shrink_main(), desc="Grow window to the left"),
                Key([mod, "control"], "l", lazy.layout.grow_main(), desc="Grow window to the right"),
                Key([mod, "control"], "j", lazy.layout.shrink(), desc="Grow window down"),
                Key([mod, "control"], "k", lazy.layout.grow(), desc="Grow window up"),
                Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
                Key(
                    [mod, "shift"],
                    "Return",
                    lazy.layout.toggle_split(),
                    desc="Toggle between split and unsplit sides of stack",
                ),
                Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
                Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
                Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
                Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
                Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
                Key([mod, "shift"], "space", lazy.window.toggle_floating(), desc="Toggle floating on focused window"),
                Key([mod], "m", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
            ]

            groups = []

            group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

            group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall",]

            group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

            for i in range(len(group_names)):
                groups.append(
                        Group(
                            name=group_names[i],
                            layout=group_layouts[i].lower(),
                            label=group_labels[i]
                            )
                        )

            for i in groups:
                keys.extend([
                    Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Mod + number to move to group"),
                    Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
                        desc="Move focused window to new group.")
                    ])

            groups.append(ScratchPad("scratchpad", [
                DropDown("term", "alacritty", width=0.8, height=0.8, x=0.1, y=0.1, opacity=1),
            ]))

            keys.extend(
                    [
                        Key([mod], "grave", lazy.group['scratchpad'].dropdown_toggle('term')),
                    ]
            )

            layouts = [
                layout.MonadTall(
                        margin=8,
                        border_width=0,
                        border_focus='#7aa2f7',
                        border_normal='#7aa2f7'
                    ),
                layout.Max(),
            ]

            widget_defaults = dict(
                font="RobotoMonoNerdFont",
                background="#1E1E1E",
                foreground="#D4D4D4",
                fontsize=12,
                padding=3,
            )
            extension_defaults = widget_defaults.copy()

            screens = [
                Screen(
                    top=bar.Bar(
                        [
                            widget.GroupBox(
                                padding=0,
                                highlight_method="line",
                                this_current_screen_border="#0195F7",
                                hide_unused=True
                            ),
                            widget.WindowName(
                                padding=8
                            ),
                            widget.Chord(
                                chords_colors={
                                    "launch": ("#ff0000", "#ffffff"),
                                },
                                name_transform=lambda name: name.upper(),
                            ),
                            # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                            # widget.StatusNotifier(),
                            widget.Systray(),
                            widget.Battery(),
                            widget.PulseVolume(),
                            widget.CurrentLayout(),
                            widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                        ],
                        25,
                    ),
                ),
            ]

            mouse = [
                Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
                Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
                Click([mod], "Button2", lazy.window.bring_to_front()),
            ]

            dgroups_key_binder = None
            dgroups_app_rules = []  # type: list
            follow_mouse_focus = True
            bring_front_click = False
            cursor_warp = True
            floating_layout = layout.Floating(
                border_width = 3,
                border_focus = '#4fa6ed',
                border_normal = '#4fa6ed',
                float_rules=[
                    *layout.Floating.default_float_rules,
                    Match(wm_class="confirmreset"),  # gitk
                    Match(wm_class="makebranch"),  # gitk
                    Match(wm_class="maketag"),  # gitk
                    Match(wm_class="ssh-askpass"),  # ssh-askpass
                    Match(title="branchdialog"),  # gitk
                    Match(title="pinentry"),  # GPG key password entry
                ]
            )
            auto_fullscreen = True
            focus_on_window_activation = "smart"
            reconfigure_screens = True

            auto_minimize = True

            # When using the Wayland backend, this can be used to configure input devices.
            wl_input_rules = None

            # XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
            # string besides java UI toolkits; you can see several discussions on the
            # mailing lists, GitHub issues, and other WM documentation that suggest setting
            # this string if your java app doesn't work correctly. We may as well just lie
            # and say that we're a working one by default.
            #
            # We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
            # java that happens to be on java's whitelist.
            wmname = "LG3D"
        '';

        ".config/qtile/autostart.sh" = {
            text = ''
                sxhkd &
                xset r rate 210 110
            '';
            executable = true;
        };
    };
}
