mutable struct ContainerStyle
    background_color::Vec4{<:AbstractFloat} #RGBA color
    border_color::Vec4{<:AbstractFloat} #RGBA color
    border_width_px::Float32
    padding_px::Float32
end

function ContainerStyle(;
    background_color=Vec4{Float32}(0.8f0, 0.8f0, 0.8f0, 1.0f0),
    border_color=Vec4{Float32}(0.0f0, 0.0f0, 0.0f0, 1.0f0),
    border_width_px=1.0f0,
    padding_px::Float32=10f0 # Padding in pixels
)
    return ContainerStyle(background_color, border_color, border_width_px, padding_px)
end

struct ContainerView <: AbstractView
    child::AbstractView  # Single child view
    style::ContainerStyle
    on_click::Function
    on_mouse_down::Function
end

"""
The `Container` is the most basic GUI component that can contain another component.
It is the most basic building block of the GUI system.
"""
function Container(child::AbstractView=EmptyView(); style=ContainerStyle(), on_click::Function=() -> nothing, on_mouse_down::Function=() -> nothing)
    return ContainerView(child, style, on_click, on_mouse_down)
end

function apply_layout(view::ContainerView, x::Float32, y::Float32, width::Float32, height::Float32)
    # Extract padding from the container's layout
    padding = view.style.padding_px
    padded_x = x + padding
    padded_y = y + padding
    padded_width = width - 2 * padding
    padded_height = height - 2 * padding

    # Compute the child's position and size based on alignment
    child_width = padded_width
    child_height = padded_height

    child_x = padded_x
    child_y = padded_y

    return (child_x, child_y, child_width, child_height)
end

function interpret_view(container::ContainerView, x::Float32, y::Float32, width::Float32, height::Float32, projection_matrix::Mat4{Float32})
    # Compute the layout for the container
    (child_x, child_y, child_width, child_height) = apply_layout(container, x, y, width, height)

    # Render the container background
    bg_color = container.style.background_color
    border_color = container.style.border_color
    border_width_px = container.style.border_width_px

    vertex_positions = generate_rectangle_vertices(x, y, width, height)
    draw_rectangle(vertex_positions, bg_color, projection_matrix)

    if border_width_px > 0.0
        draw_closed_lines(vertex_positions, border_color)
    end

    # Render the child
    interpret_view(container.child, child_x, child_y, child_width, child_height, projection_matrix)
end