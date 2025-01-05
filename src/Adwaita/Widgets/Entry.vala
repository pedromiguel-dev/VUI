namespace Vui.Widget {

    protected delegate void EntryConnect (Gtk.Editable editable);
    public class Entry : Vui.Impl.Generic<Gtk.Entry> {

        public Entry(string placeholder) {
            widget = new Gtk.Entry();
            widget.set_placeholder_text (placeholder);
        }

        public unowned EntryConnect? changed {
			set {
            		widget.changed.connect(value);
			}
        }
    }
} 
