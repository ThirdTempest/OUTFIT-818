@extends('admin.layout')

@section('content')
<div class="mb-8" data-aos="fade-down">
    <h1 class="text-3xl font-bold text-gray-800">📧 Email Subscribers</h1>
    <p class="text-gray-500 mt-1">Send updates, offers, or news to all opted-in users.</p>
</div>

<!-- Send Mail Form -->
<div class="bg-white rounded-xl shadow p-6 mb-10" data-aos="zoom-in-up">
    <form action="{{ route('admin.emails.send') }}" method="POST">
    @csrf

    <div class="mb-4">
        <label class="block text-gray-700 font-semibold mb-2">Subject</label>
        <input type="text" name="subject" value="{{ old('subject') }}" class="w-full border px-4 py-2 rounded shadow-sm focus:ring">
        @error('subject')
            <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label class="block text-gray-700 font-semibold mb-2">Message</label>
        <textarea name="message" rows="5" class="w-full border px-4 py-2 rounded shadow-sm focus:ring">{{ old('message') }}</textarea>
        @error('message')
            <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <button type="submit" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
        📩 Send to All Subscribers
    </button>
</form>

</div>

<!-- Email List Table -->
<div class="overflow-x-auto" data-aos="fade-up" data-aos-delay="100">
    <table class="min-w-full bg-white rounded-xl shadow">
        <thead class="bg-[#536451] text-[#f3e9d5] uppercase text-sm">
            <tr>
                <th class="py-3 px-6 text-left">#</th>
                <th class="py-3 px-6 text-left">Email Address</th>
                <th class="py-3 px-6 text-left">Subscribed At</th>
                <th class="py-3 px-6 text-right">Actions</th>
            </tr>
        </thead>
        <tbody class="text-gray-700 text-sm">
            @forelse ($emails as $index => $email)
            <tr class="border-b hover:bg-gray-50" data-aos="fade-up" data-aos-delay="{{ $index * 100 }}">
                <td class="py-3 px-6">{{ $index + 1 }}</td>
                <td class="py-3 px-6">{{ $email->email }}</td>
                <td class="py-3 px-6">{{ $email->created_at->format('Y-m-d H:i') }}</td>
                <td class="py-3 px-6 text-right">
                    <form action="{{ route('admin.emails.destroy', $email) }}" method="POST" onsubmit="return confirm('Are you sure?')">
                        @csrf
                        @method('DELETE')
                        <button class="text-red-500 hover:underline text-sm">Delete</button>
                    </form>
                </td>
            </tr>
            @empty
            <tr data-aos="fade-up">
                <td colspan="4" class="text-center text-gray-500 py-4">No subscribers yet.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
