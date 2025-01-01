namespace Vui.Widget {

    protected delegate string String ();
    public struct Label : Vui.Impl.Wrap<Gtk.Label, Label> {

        public Label wrap (bool wrap) {
            _widget.set_wrap (wrap);
            return this;
        }
        public Label lines (int lines) {
            _widget.set_lines (lines);
            return this;
        }
        public Label ellipsize (Pango.EllipsizeMode mode) {
            _widget.set_ellipsize (mode);
            return this;
        }

        // public Label.ref (String? label = null, Vui.Model.Store? state = null) {
        //     _widget = new Gtk.Label (label());
        //     if(state != null)
        //         state.changed.connect (() => {
        //            _widget.label = label();
        //         });
        // }

        public Label (string label) {
            _widget = new Gtk.Label (label);
        }
    }
}
