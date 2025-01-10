namespace Vui.Widget {

    public class Entry : Vui.Impl.Subclass<Gtk.Entry> {

        public delegate void srting_buffer_callback (string text);

        public unowned srting_buffer_callback? string_buffer {
            set {
                widget.changed.connect ((e) => value (e.text));
            }
        }

        public Entry (string placeholder) {
            widget = new Gtk.Entry ();
            widget.set_placeholder_text (placeholder);
            this.child = widget;
        }
    }
}
