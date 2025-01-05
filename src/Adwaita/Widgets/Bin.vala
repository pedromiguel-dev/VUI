namespace Vui.Widget {
    public class Bin : Vui.Impl.Generic<Adw.Bin> {

        public Gtk.Overflow overflow {
            set {
                widget.set_overflow (value);
            }
        }

        public Vui.Impl.Generic content {
            set {
                widget.set_child (value.gtk_widget);
            }
        }
        public Bin () {
            widget = new Adw.Bin ();
        }
    }
}
