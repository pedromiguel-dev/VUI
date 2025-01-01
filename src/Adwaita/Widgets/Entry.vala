namespace Vui.Widget {

    protected delegate void EntryConnect (Gtk.Editable editable);
    public struct Entry : Vui.Impl.Wrap<Gtk.Entry, Entry> {

        public Entry(string placeholder) {
            _widget = new Gtk.Entry();
            _widget.set_placeholder_text (placeholder);
        }

        public Entry changed(owned EntryConnect callback) {

            _widget.changed.connect(callback);
            return this;
        }
    }
} 
