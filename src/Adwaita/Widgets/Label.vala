namespace Vui.Widget {
    public class Label : Vui.Impl.Generic<Label, Gtk.Label> {

        public Label wrap (bool wrap) {
            widget.set_wrap (wrap);
            return this;
        }
        public Label lines (int lines) {
            widget.set_lines (lines);
            return this;
        }
        public Label ellipsize (Pango.EllipsizeMode mode) {
            widget.set_ellipsize (mode);
            return this;
        }

        protected delegate string String ();

        public Label.ref (String? label = null, Vui.Model.Store? state = null) {
            widget = new Gtk.Label (label());
            if(state != null)
                state.changed.connect (() => {
                   widget.label = label();
                });
        }

        public Label (string label) {
            widget = new Gtk.Label (label);
        }

    }
}
