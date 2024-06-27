namespace Vui.Widget {
    public class Button : Vui.Impl.Generic<Button, Gtk.Button> {
        protected delegate void action ();

        public Button do(owned action actions){
            widget.clicked.connect (() => actions());
            return this;
        }

        public Button (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget>? child = null) {
            widget = new Gtk.Button();
            widget.set_child (child.widget);
        }
        public Button.from_icon_name (string icon_name) {
            widget = new Gtk.Button.from_icon_name(icon_name);
        }
        public Button.with_label (string label) {
            widget = new Gtk.Button.with_label (label);
        }
    }
}
