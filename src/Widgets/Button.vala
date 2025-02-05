
namespace Vui {

    public class Widget.Button : Impl.View {

        public enum Shape {
            Circle,
            Pill,
            OSD,
        }

        internal Gtk.Button button_widget;

        public void set_icon_name (string icon_name) {
            this.button_widget.set_icon_name (icon_name);
        }

        public delegate void OnClick ();

        /**
         * Sets on_click callback function.
         *
         */
        public OnClick? on_click {
            owned set {
                button_widget.clicked.connect (() => value ());
            }
        }

        public Impl.View child {
            set {
                button_widget.child = value;
            }
        }

        /**
         * Sets the button shape array.
         *
         * enum Shape {
         *    Circle,
         *    Pill,
         *    OSD,
         * }
         */
        public Shape[] shape {
            set {
                foreach (var type in value) {
                    switch (type) {
                    case Circle :
                        this.button_widget.add_css_class ("circular");
                        break;
                    case Pill:
                        this.button_widget.add_css_class ("pill");
                        break;
                    case OSD:
                        this.button_widget.add_css_class ("osd");
                        break;
                    }
                }
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
