
namespace Vui {

    public class Widget.Button : Impl.View {

        internal Gtk.Button button_widget;

        public delegate void on_click_callback ();

        public void set_icon_name (string icon_name) {
            this.button_widget.set_icon_name (icon_name);
        }

        public unowned on_click_callback? on_click {
            set {
                button_widget.clicked.connect (() => value ());
            }
        }

        internal Impl.View child {
            set {
                button_widget.child = value;
            }
        }

        public Button () {
            this.button_widget = new Gtk.Button ();
            this.set_widget (this.button_widget);
        }

        public Button.from_icon_name (string icon_name) {
            this.button_widget = new Gtk.Button.from_icon_name (icon_name);
            this.set_widget (this.button_widget);
        }

        public Button.with_label (string label) {
            this.button_widget = new Gtk.Button.with_label (label);
            this.set_widget (this.button_widget);
        }
    }
}
