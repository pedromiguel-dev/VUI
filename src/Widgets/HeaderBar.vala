namespace Vui {
    public class Widget.HeaderBar : Impl.View {

        private Adw.HeaderBar headerbar_widget = new Adw.HeaderBar () {
            hexpand = true,
            vexpand = true
        };

        public bool show_back_button {
            set {
                headerbar_widget.show_back_button = value;
            }
        }

        public bool show_title {
            set {
                headerbar_widget.show_title = value;
            }
        }

        ~HeaderBar () {
            headerbar_widget.unparent ();
        }

        public HeaderBar () {
            this.set_widget (this.headerbar_widget);
        }
    }
}
