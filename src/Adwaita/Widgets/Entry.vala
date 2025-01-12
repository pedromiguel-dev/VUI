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
                foreach (var child in value) {
                    this.destination = concatenate_arrays (this.destination, child.destination);
                    child.widget.add_css_class ("vui-section-entry");

                    var temp = new Gtk.ListBoxRow () {
                        focusable = false,
                        child = child
                    };

                    this.box_list.append (temp);
                }
                Entry first = (Entry) this.box_list.get_first_child ().get_first_child ();
                if (value.length > 1) {
                    Entry last = (Entry) this.box_list.get_last_child ().get_first_child ();
                    first.widget.add_css_class ("vui-section-entry-first");
                    last.widget.add_css_class ("vui-section-entry-last");
                } else first.widget.add_css_class ("vui-section-entry-solo");
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

        public delegate void srting_buffer_callback (string text);

        public Vui.Model.Store<string> bind_buffer {
            set {
                widget.changed.connect ((element) => value.state = element.get_text ());
            }
        }

        public Entry (string placeholder) {
            widget = new Gtk.Entry ();
            this.widget.set_placeholder_text (placeholder);
            this.child = widget;
        }
    }

    public class DatePicker : Entry {


        public DatePicker (string placeholder) {
            base (placeholder);
        }
    }
}
