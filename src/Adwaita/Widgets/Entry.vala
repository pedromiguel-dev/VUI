namespace Vui.Widget {
    public class Entry : Vui.Impl.Generic<Entry, Gtk.Entry> {
        public Entry(string placeholder, Vui.Model.Store<string>? write_to = null) {
            this.widget = new Gtk.Entry();
            this.widget.set_placeholder_text (placeholder);

            if(write_to != null)
                this.widget.changed.connect (() => {
                    print("typed: %s\n", this.widget.text);
                   write_to.state = this.widget.text;
                });
        }
    }
} 
