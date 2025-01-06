namespace Vui.Widget {

    protected delegate void EntryConnect (Gtk.Editable editable);

    public class Entry : Vui.Impl.Generic<Gtk.Entry> {

        public Entry (string placeholder) {
            widget = new Gtk.Entry ();
            widget.set_placeholder_text (placeholder);
        }

        public unowned Vui.Model.Store<string> string_bufer {
            set {
                widget.changed.connect ((e) => value.state = e.text);
            }
        }
    }
}
