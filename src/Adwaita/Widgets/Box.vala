public class Vui.Widget.HBox : Vui.Impl.Generic<Gtk.Box> {

    Vui.Impl.Generic[] concatenate_arrays(Vui.Impl.Generic[] array1, Vui.Impl.Generic[] array2) {
        // Create a new array with combined length
        Vui.Impl.Generic[] combined_array = new Vui.Impl.Generic[array1.length + array2.length];

        // Copy elements from array1
        for (int i = 0; i < array1.length; i++) {
            combined_array[i] = array1[i];
        }

        // Copy elements from array2
        for (int i = 0; i < array2.length; i++) {
            combined_array[array1.length + i] = array2[i];
        }

        return combined_array;
    }

    public Vui.Impl.Generic[] ? content {
        set {
            if (value != null)
                foreach (var child in value) {
                    if (child.destination != null)
                        this.destination = concatenate_arrays(this.destination, child.destination);
                    widget.append(child.gtk_widget);
                }
            ;
        }
    }

    public int spacing {
        set {
            widget.set_spacing(value);
        }
    }

    public HBox() {
        widget = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
    }
}

public class Vui.Widget.VBox : Vui.Impl.Generic<Gtk.Box> {

    public Vui.Impl.Generic[] ? content {
        set {
            if (value != null)
                foreach (var child in value) {
                    if (child.destination != null)
                        this.destination = child.destination;
                    widget.append(child.gtk_widget);
                }
            ;
        }
    }

    public int spacing {
        set {
            widget.set_spacing(value);
        }
    }

    public VBox() {
        widget = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
    }
}
