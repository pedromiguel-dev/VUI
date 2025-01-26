namespace Vui {
    public class Widget.Overlay : Impl.View {

        private Gtk.Overlay overlay_widget = new Gtk.Overlay ();

        public Impl.View overlay {
            set {
                this.destination = value.destination;
                overlay_widget.add_overlay (value);
            }
        }

        public Impl.View content {
            set {
                overlay_widget.set_child (value);
                this.destination = value.destination;
            }
        }

        public Overlay () {
            this.set_widget (overlay_widget);
            this.hexpand = true;
            this.vexpand = true;
        }
    }
}
