namespace Vui.Widget {
    public class AppWindow : Vui.Impl.Generic<AppWindow, Adw.ApplicationWindow> {

        public AppWindow child (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> c) {
           widget.set_content (c.widget);
            return this;
        }

        protected delegate void Bind_handler (AppWindow window);
        public AppWindow bind (Bind_handler handle){
            handle(this);
            return this;
        }

        public AppWindow handle () {
            var handle = new Gtk.WindowHandle ();
            handle.child = this.widget.child;
            widget.set_child (handle);
            return this;
        }

        public AppWindow (Gtk.Application app) {
            if(Vui.Impl.Generic.gsettings == null)
                Vui.Impl.Generic.gsettings = new GLib.Settings (app.get_application_id ());
            widget = new Adw.ApplicationWindow (app);
            widget.icon_name = app.application_id;
        }
    }
}
