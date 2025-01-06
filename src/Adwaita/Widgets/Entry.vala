namespace Vui.Widget {

    protected delegate void EntryConnect (Gtk.Editable editable);

    public class Entry : Vui.Impl.Generic<Gtk.Entry> {

        public Entry (string placeholder) {
            widget = new Gtk.Entry ();
            widget.set_placeholder_text (placeholder);
        }

        public delegate void srting_buffer_callback (string text);

        public unowned srting_buffer_callback? string_buffer {
            set {
                this.widget.changed.connect ((e) => value (e.text));
            }
        }
    }
}
