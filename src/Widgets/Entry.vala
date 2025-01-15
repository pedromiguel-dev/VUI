namespace Vui.Widget {

    public class Section : Vui.Widget.VBox {
        private Gtk.ListBox box_list;

        public new EntryCommon[] content {
            set {
                foreach (var entry in value) {
                    var click_controller = new Gtk.GestureClick ();
                    var focus_controller = new Gtk.EventControllerFocus ();

                    var row = new Gtk.ListBoxRow () {
                        child = entry,
                        focusable = false,
                    };

                    // on click focus will move to entry
                    entry.add_controller (click_controller);
                    click_controller.pressed.connect (() => entry.widget.focus (Gtk.DirectionType.DOWN));

                    // when focus is on entry set row's styles
                    entry.widget.set_can_target (false);
                    entry.widget.add_controller (focus_controller);
                    entry.widget.add_css_class ("vui-section-entry");
                    focus_controller.enter.connect (() => row.add_css_class ("vui-section-row-focused"));
                    focus_controller.leave.connect (() => row.remove_css_class ("vui-section-row-focused"));

                    this.destination = concatenate_arrays (this.destination, entry.destination);
                    this.box_list.append (row);
                }
                Gtk.ListBoxRow first = (Gtk.ListBoxRow) this.box_list.get_first_child ();
                if (value.length > 1) {
                    Gtk.ListBoxRow last = (Gtk.ListBoxRow) this.box_list.get_last_child ();
                    first.add_css_class ("vui-section-row-first");
                    last.add_css_class ("vui-section-row-last");
                } else first.add_css_class ("vui-section-row-solo");
            }
        }

        public Section (string? header = null) {
            this.box_list = new Gtk.ListBox ();
            this.box_list.add_css_class ("vui-section");
            this.box_list.set_selection_mode (Gtk.SelectionMode.NONE);

            if (header != null) {
                this.prepend (new Vui.Widget.Label (header) {
                    css_classes = { "heading", "dimmed-gray" },
                    halign = Gtk.Align.START,
                    margin_bottom = 8,
                    margin_top = 8,
                });
            }

            this.margin_bottom = 8;
            this.valign = Gtk.Align.FILL;
            this.halign = Gtk.Align.FILL;
            this.append (this.box_list);
        }
    }

    public abstract class EntryCommon : Vui.Impl.Subclass<Gtk.Widget> {

        private Gtk.Overlay overlay = new Gtk.Overlay ();

        protected Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 8) {
            margin_start = 4,
            margin_end = 8,
            halign = Gtk.Align.END
        };

        public virtual Vui.Widget.Button append {
            set {
                value.css_classes = { "flat", "circular" };
                value.halign = Gtk.Align.CENTER;
                value.valign = Gtk.Align.CENTER;
                this.box.append (value);
            }
        }

        public T get_widget<T> () {
            return (T) this.widget;
        }

        public void set_widget<T> (T widget) {
            this.widget = (Gtk.Widget) widget;
            overlay.child = this.widget;
        }

        private EntryCommon (string placeholder) {
            this.overlay.add_overlay (this.box);
            this.child = this.overlay;
        }
    }

    public class Entry : EntryCommon {
        public Entry (string placeholder, owned Vui.Model.Store<string>? state = null) {
            base (placeholder);
            set_widget<Gtk.Entry> (new Gtk.Entry () {
                placeholder_text = placeholder,
                css_classes = { "vui-section-entry-text" }
            });
            if (state != null)
                get_widget<Gtk.Entry> ().changed.connect ((element) => state.state = element.get_text ());
        }
    }

    public class Toggle : EntryCommon {

        private Gtk.GestureClick click_controller = new Gtk.GestureClick ();

        private Gtk.Switch toggle = new Gtk.Switch () {
            css_classes = { "flat" },
            halign = Gtk.Align.CENTER,
            valign = Gtk.Align.CENTER,
        };

        private void set_controller () {
            this.add_controller (click_controller);
            this.click_controller.pressed.connect (() => {
                toggle.activate ();
                toggle.grab_focus ();
            });
        }

        public Toggle (string placeholder, owned Vui.Model.Store<bool>? state = null) {
            base (placeholder);

            set_widget<Gtk.Entry> (new Gtk.Entry () {
                placeholder_text = placeholder,
                css_classes = { "vui-section-entry-text" }
            });
            get_widget<Gtk.Entry> ().set_can_focus (false);
            get_widget<Gtk.Entry> ().set_can_target (false);
            get_widget<Gtk.Entry> ().set_text (placeholder);
            this.toggle.set_can_target (false);

            this.set_controller ();

            this.toggle.state_set.connect ((value) => {
                state.state = value;
                return false;
            });

            this.box.append (toggle);
        }
    }

    public class SpinRow : EntryCommon {

        private Gtk.Entry text = new Gtk.Entry () {
            css_classes = { "vui-section-entry", "vui-section-spin-row-text" },
            valign = Gtk.Align.CENTER,
            vexpand = false,
            input_purpose = Gtk.InputPurpose.NUMBER,
            xalign = (float) 0.99,
            text = "0"
        };
        private Gtk.Button button_plus = new Gtk.Button.from_icon_name ("plus-symbolic") {
            css_classes = { "circular" },
            halign = Gtk.Align.CENTER,
            valign = Gtk.Align.CENTER
        };
        private Gtk.Button button_minus = new Gtk.Button.from_icon_name ("minus-symbolic") {
            css_classes = { "circular" },
            halign = Gtk.Align.CENTER,
            valign = Gtk.Align.CENTER
        };

        private void build () {
            this.box.append (text);
            this.box.append (button_plus);
            this.box.append (button_minus);
        }

        public SpinRow (string placeholder, owned Vui.Model.Store<int>? state = null) {
            base (placeholder);

            set_widget<Gtk.Entry> (new Gtk.Entry () {
                placeholder_text = placeholder,
                css_classes = { "vui-section-entry-text" }
            });
            get_widget<Gtk.Entry> ().set_can_focus (false);
            get_widget<Gtk.Entry> ().set_can_target (false);
            get_widget<Gtk.Entry> ().set_text (placeholder);

            state.changed.connect ((value) => this.text.set_text (value.to_string ()));

            this.button_plus.clicked.connect (() => {
                state.state++;
            });

            this.button_minus.clicked.connect (() => {
                state.state--;
            });

            this.build ();
        }
    }

    public class PasswordEntry : EntryCommon {
        private Button reveal_button = new Button.from_icon_name ("view-reveal-symbolic");

        public PasswordEntry (string placeholder, owned Vui.Model.Store<string>? state = null) {
            base (placeholder);

            set_widget<Gtk.PasswordEntry> (new Gtk.PasswordEntry () {
                placeholder_text = placeholder,
                css_classes = { "vui-section-entry-text" },
            });

            if (state != null)
                get_widget<Gtk.PasswordEntry> ().changed.connect ((element) => state.state = element.get_text ());

            this.reveal_button.on_click = () => {
                var entry = get_widget<PasswordEntry> ();
                var text = (Gtk.Text) entry.get_first_child ();
                text.set_visibility (!text.get_visibility ());
            };

            this.append = this.reveal_button;
        }
    }
}
