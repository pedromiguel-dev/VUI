namespace Vui.Widget {

    protected delegate void handle_function<T> (T this_);
    public struct Window : Vui.Impl.Wrap<Adw.ApplicationWindow, Window> {

        public static App _app {get {return _app; } set{_app = value;} }

        public Window child (Vui.Impl.Wrap content) {
            _widget.set_content (content.widget);
            return this;
        }

        public Window (owned Adw.Application app) {
            _widget = new Adw.ApplicationWindow (app);
        }

        public Window bind (handle_function<Window?> handle){
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
}

