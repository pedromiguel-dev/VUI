namespace Vui {
    public class Widget.ScrolledBox : Impl.View {

        private Gtk.ScrolledWindow scrolledwindow_widget = new Gtk.ScrolledWindow ();

        public Gtk.PolicyType vscroll_policy {
            set {
                scrolledwindow_widget.vscrollbar_policy = value;
            }
        }

        public Gtk.PolicyType hscroll_policy {
            set {
                scrolledwindow_widget.hscrollbar_policy = value;
            }
        }

        public Impl.View content {
            set {
                this.destination = value.destination;
                scrolledwindow_widget.set_child (value);
            }
        }

        public ScrolledBox () {
            this.set_widget (scrolledwindow_widget);
        }
    }
}
