namespace Vui.Widget{
    public struct Bin : Vui.Impl.Wrap<Adw.Bin, Bin> {

        public Bin overflow (Gtk.Overflow overflow) {
            _widget.set_overflow (overflow);
            return this;
        }

        public Bin (Vui.Impl.Wrap child) {
            _widget = new Adw.Bin();
            _widget.set_child(child.widget);
        }
    }
}
