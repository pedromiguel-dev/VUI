namespace Vui.Widget {
    using Vui.Impl;

    protected delegate void Bind_handler (AppWindow window);
    protected delegate void b_handler (Window window);

    public struct Window : WidgetImpl<Adw.ApplicationWindow> {
        public Window child (WidgetImpl<Gtk.Widget> c) {
            _widget.set_content (c._widget);
            return this;
        }

        public Window (Adw.Application app) {
            _widget = new Adw.ApplicationWindow (app);
            _widget.icon_name = app.application_id;
        }

        public Window bind (b_handler handle){
            handle(this);
            return this;
        }

        public Window handle () {
            var handle = new Gtk.WindowHandle ();
            handle.child = this._widget.child;
            _widget.set_child (handle);
            return this;
        }
    }

    public class AppWindow : Vui.Impl.Generic<AppWindow, Adw.ApplicationWindow> {

        public AppWindow child (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> c) {
           widget.set_content (c.widget);
            return this;
        }

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
