namespace Vui.Widget {

    public class Section : Vui.Widget.VBox {
        private Gtk.ListBox box_list;
        public string header {
            set {
                this.prepend (new Vui.Widget.Label (value) {
                    css_classes = { "heading", "dimmed-gray" },
                    halign = Gtk.Align.START,
                    margin_bottom = 8,
                    margin_top = 8,
                });
            }
        }

        public new Entry[] content {
            set {

                foreach (var entry in value) {
                    var click_controller = new Gtk.GestureClick ();
                    var focus_controller = new Gtk.EventControllerFocus ();
                    var row = new Gtk.ListBoxRow () {
                        child = entry,
                        focusable = false,
                    };
                    entry.set_focusable (false);
                    entry.add_controller (click_controller);
                    entry.widget.add_controller (focus_controller);
                    entry.widget.add_css_class ("vui-section-entry");

                    click_controller.pressed.connect (() => entry.widget.focus (Gtk.DirectionType.DOWN));
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

        public Section () {
            this.box_list = new Gtk.ListBox ();
            this.box_list.add_css_class ("vui-section");
            this.box_list.set_selection_mode (Gtk.SelectionMode.NONE);

            this.margin_bottom = 8;
            this.valign = Gtk.Align.FILL;
            this.halign = Gtk.Align.FILL;
            this.append (this.box_list);
        }
    }

    public class Entry : Vui.Impl.Subclass<Gtk.Entry> {
        private Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);

        public Vui.Model.Store<string> bind_buffer {
            set {
                widget.changed.connect ((element) => value.state = element.get_text ());
            }
        }

        public Vui.Widget.Button append {
            set {
                value.css_classes = { "flat" };
                value.halign = Gtk.Align.CENTER;
                value.valign = Gtk.Align.CENTER;
                this.box.append (value);
            }
        }

        public Entry (string placeholder) {
            widget = new Gtk.Entry ();
            widget.set_hexpand (true);
            box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 10) {
                margin_start = 3,
                margin_end = 5,
                margin_top = 3,
                margin_bottom = 3
            };

            this.widget.set_placeholder_text (placeholder);
            this.box.append (widget);

            this.child = box;
        }
    }

    public class DatePicker : Entry {

        public DatePicker (string placeholder) {
            base (placeholder);
        }
    }
}
