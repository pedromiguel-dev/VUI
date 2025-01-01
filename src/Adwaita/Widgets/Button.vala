namespace Vui.Widget {

    protected delegate void Callback ();
    public struct Button : Vui.Impl.Wrap<Gtk.Button, Button> {

        public Button do(owned Callback actions){
            _widget.clicked.connect (actions);
            return this;
        }
        public Button () {
            _widget = new Gtk.Button();
        }
        public Button.from_icon_name (string icon_name) {
            _widget = new Gtk.Button.from_icon_name(icon_name);
        }
        public Button.with_label (string label) {
            _widget = new Gtk.Button.with_label (label);
        }
    }
}
