namespace Vui {
    protected class Widget.Box : Impl.View {

        private Gtk.BoxLayout layout_maneger = new Gtk.BoxLayout (Gtk.Orientation.HORIZONTAL);

        internal Impl.View[] concatenate_arrays (Impl.View[] array1, Impl.View[] array2) {
            Impl.View[] combined_array = new Impl.View[array1.length + array2.length];

            for (int i = 0; i < array1.length; i++) {
                combined_array[i] = array1[i];
            }

            for (int i = 0; i < array2.length; i++) {
                combined_array[array1.length + i] = array2[i];
            }

            return combined_array;
        }

        public Gtk.Widget[] content {
            set {
                foreach (var child in value) {
                    if (child is Impl.View)
                        this.destination = concatenate_arrays (this.destination, ((Impl.View) child).destination);

                    this.set_child (child);
                }
            }
        }

        public int spacing {
            get {
                return this.layout_maneger.spacing;
            }
            set {
                this.layout_maneger.spacing = value;
            }
        }

        public Gtk.Orientation orientation {
            get {
                return this.layout_maneger.orientation;
            }
            set {
                this.layout_maneger.orientation = value;
            }
        }

        public void append (Gtk.Widget widget) {
            this.set_child (widget);
        }

        public void prepend (Gtk.Widget widget) {
            foreach (Gtk.Widget child in this.children) {
                child.unparent ();
            }
            this.set_child (widget);
            foreach (Gtk.Widget child in this.children) {
                if (child.get_parent () == null)
                    set_child (child);
            }
        }

        construct {
            this.set_layout_manager (layout_maneger);
        }
    }

    public class Widget.HBox : Widget.Box {
        public HBox (int spacing = 6) {
            this.spacing = spacing;
            this.orientation = Gtk.Orientation.HORIZONTAL;
        }
    }

    public class Widget.VBox : Widget.Box {
        public VBox (int spacing = 6) {
            this.spacing = spacing;
            this.orientation = Gtk.Orientation.VERTICAL;
        }
    }
}
