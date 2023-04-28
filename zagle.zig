const std = @import("std");

pub const Greeter = struct {
    /// The allocator
    allocator: std.mem.Allocator,

    /// Errors that may occur
    pub const Error = error{
        OutOfMemory,
    };

    /// Creates a Greeter with an Allocator
    /// Greeter needs to be managed by the user
    pub fn init(allocator: std.mem.Allocator) Greeter {
        return .{
            .allocator = allocator,
        };
    }

    /// Returns a formatted greeting string or an error
    pub fn greeter(self: *Greeter, literal: []const u8) Error![]u8 {
        return try std.fmt.allocPrint(
            self.allocator,
            "Hello, {s}",
            .{literal},
        );
    }
};
