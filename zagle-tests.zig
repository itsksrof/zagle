const std = @import("std");
const ArenaAllocator = std.heap.ArenaAllocator;

const zagle = @import("./zagle.zig");
const Greeter = zagle.Greeter;

test "Greeter usage" {
    // Use your favorite allocator
    var arena = ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    // Create your Greeter
    var myGreeter = Greeter.init(arena.allocator());

    // Use the provided functions
    const greet = try myGreeter.greeter("zig");
    try std.testing.expectEqualStrings("Hello, zig", greet);
}
