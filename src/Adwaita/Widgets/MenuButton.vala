namespace Vui.Widget {
    public struct MenuButton : Vui.Impl.Wrap<Gtk.MenuButton, MenuButton> {

        public MenuButton icon_name (string name){
            _widget.set_icon_name (name);
            return this;
        }

        public MenuButton (Vui.Impl.Wrap popover) {
            var ppvr = new Gtk.Popover () { child = popover.widget };
            widget = new Gtk.MenuButton () { popover = ppvr };
        }
    }
}
