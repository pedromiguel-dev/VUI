namespace Vui.Widget{
    public class Bin : Vui.Impl.Generic<Bin, Adw.Bin> {

        public Bin overflow (Gtk.Overflow overflow) {
            widget.set_overflow (overflow);
            return this;
        }

        public Bin (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> child) {
            widget = new Adw.Bin();
            widget.set_child(child.widget);
        }
    }
}
