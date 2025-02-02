namespace Vui {
    public class Widget.Image : Impl.View {
        private Gtk.Picture image_widget;

        public Gtk.ContentFit fit {
            set {
                this.image_widget.set_content_fit (value);
            }
        }
        public class Image (Model.Store<string> resource_bind) {
            this.image_widget = new Gtk.Picture.for_resource (resource_bind.get ());
            this.set_widget (image_widget);

            resource_bind.changed.connect ((val) => {
                this.image_widget.set_resource (val);
            });
        }
    }
}
