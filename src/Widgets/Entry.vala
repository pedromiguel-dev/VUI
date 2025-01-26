namespace Vui {

    public class Widget.Section : Vui.Widget.VBox {
        private Gtk.ListBox box_list;
        private Gtk.ListBox trigger_box;

        public new Widget.EntryCommon[] content {
            set {
                if (value.length > 1) {
                    value[value.length - 1].add_css_class ("vui-section-entry-text-last");
                    value[0].add_css_class ("vui-section-entry-text-first");
                } else {
                    value[0].add_css_class ("vui-section-entry-text-solo");
                }

                int i = 0;
                foreach (var entry in value) {
                    i++;
                    var row = new Gtk.ListBoxRow () {
                        child = entry,
                        focusable = false,
                        activatable = false,
                    };
                    entry.add_css_class ("vui-section-entry-text");
                    row.add_css_class ("vui-section-entry-row");
                    if (i == value.length)
                        row.add_css_class ("remove-last-border");

                    this.destination = concatenate_arrays (this.destination, entry.destination);
                    this.box_list.append (row);
                }
            }
        }

        public Button bottom {
            set {
                value.add_css_class ("vui-section-entry-text-solo");
                var row = new Gtk.ListBoxRow () {
                    child = value,
                    focusable = false,
                    activatable = false,
                };
                row.add_css_class ("vui-section-entry-row");

                this.destination = concatenate_arrays (this.destination, value.destination);
                this.trigger_box.append (row);
            }
        }

        public Section (string? header = null) {
            this.box_list = new Gtk.ListBox () {
                show_separators = true
            };
            this.trigger_box = new Gtk.ListBox ();

            this.box_list.add_css_class ("vui-section");
            this.box_list.set_selection_mode (Gtk.SelectionMode.NONE);

            this.trigger_box.add_css_class ("vui-section");
            this.trigger_box.set_selection_mode (Gtk.SelectionMode.NONE);

            if (header != null) {
                this.prepend (new Vui.Widget.Label (header) {
                    css_classes = { "heading", "dimmed-gray" },
                    halign = Gtk.Align.START,
                    margin_bottom = 8,
                    margin_top = 8,
                });
            }

            this.valign = Gtk.Align.FILL;
            this.halign = Gtk.Align.FILL;
            this.append (this.box_list);
            this.append (this.trigger_box);
        }
    }

    public abstract class Widget.EntryCommon<T>: Impl.View {

        private Gtk.Overlay overlay_widget = new Gtk.Overlay ();

        internal T entry_widget;

        private Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 8) {
            halign = Gtk.Align.END,
            margin_end = 4,
            spacing = 4,
        };

        internal void set_entry_widget (T entry_widget) {
            this.entry_widget = entry_widget;
            overlay_widget.child = (Gtk.Widget) this.entry_widget;
        }

        public virtual new void add_css_class (string css_class) {
            var tmp = (Gtk.Widget) this.entry_widget;
            tmp.add_css_class (css_class);
        }

        public virtual Gtk.Widget append {
            set {
                value.halign = Gtk.Align.CENTER;
                value.valign = Gtk.Align.CENTER;
                this.box.append (value);
            }
        }

        private EntryCommon () {
            this.overlay_widget.add_overlay (this.box);
            this.set_widget (overlay_widget);
        }
    }

    public class Widget.Entry : Widget.EntryCommon<Gtk.Entry> {
        public Entry (string placeholder, owned Vui.Model.Store<string>? state = null) {
            base ();
            this.set_entry_widget (new Gtk.Entry () {
                placeholder_text = placeholder,
            });

            if (state != null)
                this.entry_widget.changed.connect ((element) => state.state = element.get_text ());
        }
    }

    public class Widget.Toggle : EntryCommon<Gtk.Entry> {

        private Gtk.GestureClick click_controller = new Gtk.GestureClick ();

        private Gtk.Switch toggle = new Gtk.Switch () {
            css_classes = { "flat" },
            halign = Gtk.Align.CENTER,
            valign = Gtk.Align.CENTER,
            can_target = false,
        };

        private void set_controller () {
            this.add_controller (click_controller);
            this.click_controller.pressed.connect (() => {
                message ("Toggle controller");
                toggle.activate ();
                toggle.grab_focus ();
            });
        }

        public Toggle (string placeholder, owned Vui.Model.Store<bool>? state = null) {
            base ();
            this.set_entry_widget (new Gtk.Entry () {
                text = placeholder,
                placeholder_text = placeholder,
                can_focus = false,
                can_target = false,
            });

            this.set_controller ();

            if (state != null) {
                this.toggle.state_set.connect ((value) => {
                    state.state = value;
                    return false;
                });
            }

            this.append = toggle;
        }
    }

    public class Widget.SpinRow : EntryCommon<Gtk.Entry> {

        private Gtk.Entry text = new Gtk.Entry () {
            css_classes = { "vui-section-spin-row" },
            input_purpose = Gtk.InputPurpose.NUMBER,
            xalign = (float) 0.99,
            text = "0"
        };

        private Gtk.Button button_plus = new Gtk.Button.from_icon_name ("plus-symbolic") {
            css_classes = { "circular", "small-button" },
        };

        private Gtk.Button button_minus = new Gtk.Button.from_icon_name ("minus-symbolic") {
            css_classes = { "circular", "small-button" },
        };

        private void build () {
            this.append = text;
            this.append = button_plus;
            this.append = button_minus;
        }

        public SpinRow (string placeholder, owned Vui.Model.Store<int>? state = null) {
            base ();
            this.set_entry_widget (new Gtk.Entry () {
                text = placeholder,
                placeholder_text = placeholder,
                can_focus = false,
                can_target = false,
            });

            if (state != null) {
                this.button_plus.clicked.connect (() => {
                    var number = int.parse (this.text.get_text ()) + 1;
                    this.text.set_text (number.to_string ());
                    state.state = number;
                });

                this.button_minus.clicked.connect (() => {
                    var number = int.parse (this.text.get_text ()) - 1;
                    this.text.set_text (number.to_string ());
                    state.state = number;
                });
            }

            this.build ();
        }
    }

    public class Widget.PasswordEntry : EntryCommon<Gtk.PasswordEntry> {

        private Button reveal_button = new Button.from_icon_name ("reveal-symbolic") {
            css_classes = { "flat", "circular", "small-button" }
        };

        public PasswordEntry (string placeholder, owned Vui.Model.Store<string>? state = null) {
            base ();

            this.set_entry_widget (new Gtk.PasswordEntry () {
                placeholder_text = placeholder,
                name = "password-entry-view"
            });

            if (state != null)
                this.entry_widget.changed.connect ((element) => state.state = element.get_text ());

            this.reveal_button.on_click = () => {
                var text = (Gtk.Text) this.entry_widget.get_first_child ();

                text.set_visibility (!text.get_visibility ());
                if (text.get_visibility () == true) {
                    this.reveal_button.set_icon_name ("unreveal-symbolic");
                } else {
                    this.reveal_button.set_icon_name ("reveal-symbolic");
                }
            };

            this.append = this.reveal_button;
        }
    }
}
