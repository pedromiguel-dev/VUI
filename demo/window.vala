/* window.vala
 *
 * Copyright 2024-2025 Pedro Miguel
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

using Vui.Widget;
using Vui.Model;
using Vui.Impl;
using Vui.Flow;

namespace Demo {

    public class FormScreen : View {

        private Store<bool> toogle = new Store<bool> (false);
        private Store<int> spinrow = new Store<int> (0);

        construct {
            view = new ToolBar ("Account") {
                make_title = {},
                show_headerbar_title = false,
                content = new VBox (0) {
                    margin = { 0, 0, 20, 20 },
                    content = {
                        new Section ("Personal Information") {
                            content = {
                                new Entry ("First Name") {
                                    append = new Button.from_icon_name ("document-edit-symbolic") {
                                        css_classes = { "flat" },
                                        on_click = () => message ("button was clicked")
                                    }
                                },
                                new Entry ("Last Name"),
                            }
                        },
                        new Section ("Actions") {
                            content = {
                                new PasswordEntry ("Password here"),
                                new Toggle ("Birthday", toogle),
                                new SpinRow ("Something is: ", spinrow),
                            },
                            bottom = new Button.with_label ("Solo button") {
                                css_classes = { "suggested-action" }
                            }
                        }
                    }
                }
            };
        }
    }

    public class StateScreen : View {
        private Store<string> state = new Store<string> ("There must be something here");
        private Store<bool> state2 = new Store<bool> (true);

        construct {
            view = new ToolBar ("Reacting to changes") {
                show_headerbar_title = false,
                content = new VBox (10) {
                    margin = { 0, 0, 20, 20 },
                    vexpand = true,
                    valign = Gtk.Align.CENTER,
                    content = {
                        new Vui.Flow.ShowIf (state2) {
                            content = {
                                new Label.ref (state) {
                                    css_classes = { "title-1" },
                                    margin_bottom = 30,
                                    wrap = true,
                                }
                            }
                        },
                        new Section () {
                            halign = Gtk.Align.FILL,
                            content = {
                                new Entry ("Type your password") {
                                    hexpand = true,
                                },
                            }
                        },
                        new Button.with_label ("Click me!!") {
                            css_classes = { "pill" },
                            halign = Gtk.Align.CENTER,
                            on_click = () => state2.state = !state2.state
                        }
                    },
                }
            };
        }
    }

    public class Diceroller : View {

        construct {
            string res = "/io/github/pedromigueldev/vui/demo/";
            var result = new Store<int> (1);
            var dice_res = new Store<string> (res + "dice_1");

            result.watch ((state) => {
                switch (state) {
                    case 1:
                        dice_res.set (res + "dice_1");
                        break;
                    case 2:
                        dice_res.set (res + "dice_2");
                        break;
                    case 3:
                        dice_res.set (res + "dice_3");
                        break;
                    case 4:
                        dice_res.set (res + "dice_4");
                        break;
                    case 5:
                        dice_res.set (res + "dice_5");
                        break;
                    default:
                        dice_res.set (res + "dice_6");
                        break;
                }
            });

            var button = new Button () {
                align = { Gtk.Align.CENTER },
                child = new Label ("Hey"),
                shape = { Button.Shape.Pill },
                on_click = () => {
                    result.set (GLib.Random.int_range (1, 7));
                },
            };

            view = new ToolBar ("Dice roller") {
                content = new VBox (10) {
                    expand = {},
                    margin = { 0, 0, 20, 20 },
                    align = { Gtk.Align.CENTER },
                    content = {
                        new Image (dice_res),
                        button
                    }
                }
            };
        }
    }

    public class Overlay : View {

        private Store<int> spinrow = new Store<int> (0);

        public Overlay () {
            view = new Vui.Widget.Overlay () {
                overlay = new Button.from_icon_name ("list-add-symbolic") {
                    expand = { true },
                    align = { Gtk.Align.END },
                    margin_bottom = 20,
                    css_classes = { "suggested-action" },
                    shape = { Button.Shape.Circle },
                    on_click = () => {
                        new Dialog () {
                            content_size = { 500, 500 },
                            content = new ToolBar ("Dialog") {
                                content = new VBox () {
                                    valign = Gtk.Align.CENTER,
                                    content = {
                                        new Label ("TESTE") {
                                            css_classes = { "title-1" }
                                        }
                                    }
                                }
                            }
                        };
                    }
                },
                content = new ScrolledBox () {
                    content = new VBox (20) {
                        content = {
                            new Button.with_label ("Dialog") {
                                on_click = () => {
                                    new AlertDialog ("Hey it's a dialog!", "This is just a presentaion") {
                                        content = new VBox () {
                                            expand = { true },
                                            content = {
                                                new Entry ("Vui Entry"),
                                                new SpinRow ("SpinRow", spinrow),
                                                new Toggle ("Toggle"),
                                                new PasswordEntry ("Password here")
                                            }
                                        },
                                        action = "Try me.",
                                        action_suggested = "Close window",
                                        action_destructive = "Cancel",
                                    };
                                }
                            },
                            new PageLink (new FormScreen ()) {
                                valign = Gtk.Align.CENTER,
                                hexpand = true,
                                trigger = new Button.with_label ("Account Screen"),
                            },
                            new PageLink (new Diceroller ()) {
                                valign = Gtk.Align.CENTER,
                                hexpand = true,
                                trigger = new Button.with_label ("Dice roller"),
                            },
                            new PageLink (new StateScreen ()) {
                                align = { Gtk.Align.CENTER, Gtk.Align.END },
                                hexpand = true,
                                trigger = new Label ("third screen"),
                            },
                        }
                    }
                }
            };
        }
    }


    public class Home : View {
        construct {
            view = new Navigation () {
                pages = {
                    new ToolBar ("Journal") {
                        show_headerbar_title = true,
                        make_title = {
                            new Button.from_icon_name ("document-edit-symbolic") {
                                shape = { Button.Shape.Circle },
                            },
                            new Button.from_icon_name ("view-more-horizontal-symbolic") {
                                shape = { Button.Shape.Circle },
                            }
                        },
                        content = new VBox (14) {
                            margin = { 0, 0, 20, 20 },
                            vexpand = true,
                            content = {
                                new Demo.Overlay ()
                            }
                        }
                    }
                }
            };
        }
    }
}
