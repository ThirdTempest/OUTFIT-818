// public/js/admin-modals.js

/** Carousel Modals */
const CarouselModal = {
    toggle() {
        const modal = document.getElementById('carouselModal');
        modal.classList.toggle('hidden');
        modal.classList.toggle('flex');
        reInitAOS();
    },
    toggleEdit() {
        const modal = document.getElementById('editCarouselModal');
        modal.classList.toggle('hidden');
        modal.classList.toggle('flex');
        reInitAOS();
    },
    openEdit(button) {
        const carousel = JSON.parse(button.getAttribute('data-carousel'));
        document.getElementById('editCarouselForm').action = `${baseUpdateUrl.carousels}/${carousel.id}`;
        document.getElementById('editTitle').value = carousel.title;
        document.getElementById('editDescription').value = carousel.description;
        document.getElementById('editIsActive').checked = !!carousel.is_active;
        this.toggleEdit();
    }
};

/** Category Modals */
const CategoryModal = {
    openAdd() {
        document.getElementById('addCategoryModal').classList.remove('hidden');
    },
    closeAdd() {
        document.getElementById('addCategoryModal').classList.add('hidden');
    },
    openEdit(id, name, slug, status) {
        document.getElementById('editCategoryForm').action = `${baseUpdateUrl.categories}/${id}`;
        document.getElementById('editName').value = name;
        document.getElementById('editStatus').value = status;
        document.getElementById('editCategoryModal').classList.remove('hidden');
    },
    closeEdit() {
        document.getElementById('editCategoryModal').classList.add('hidden');
    }
};

/** Featured Modals */
const FeaturedModal = {
    open() {
        document.getElementById('featuredModal').classList.remove('hidden');
    },
    close() {
        document.getElementById('featuredModal').classList.add('hidden');
    },
    openEdit() {
        document.getElementById('editFeaturedModal').classList.remove('hidden');
    },
    closeEdit() {
        document.getElementById('editFeaturedModal').classList.add('hidden');
    },
    openReplace() {
        alert('Implement replace modal if needed.');
    }
};

/** New Arrival Modals */
const NewArrivalModal = {
    openAdd() {
        document.getElementById('addNewArrivalModal').classList.remove('hidden');
    },
    closeAdd() {
        document.getElementById('addNewArrivalModal').classList.add('hidden');
    },
    openEdit(id, name, description, imageUrl, status, price) {
        const form = document.getElementById('editArrivalForm');
        form.action = `${baseUpdateUrl.arrivals}/${id}`;
        document.getElementById('edit_name').value = name;
        document.getElementById('edit_description').value = description;
        document.getElementById('edit_image_preview').src = imageUrl;
        document.getElementById('edit_status').value = status;
        document.getElementById('editPrice').value = price;
        document.getElementById('editNewArrivalModal').classList.remove('hidden');
    },
    closeEdit() {
        document.getElementById('editNewArrivalModal').classList.add('hidden');
    }
};

/** Product Modals */
const ProductModal = {
    openAdd() {
        document.getElementById('addProductModal').classList.remove('hidden');
    },
    closeAdd() {
        document.getElementById('addProductModal').classList.add('hidden');
    },
    openEdit(button) {
        const product = JSON.parse(button.getAttribute('data-product'));
        console.log("Parsed product:", product); // ✅ Add this

        document.getElementById('editProductModal').classList.remove('hidden');
        document.getElementById('editProductForm').action = `${baseUpdateUrl.products}/${product.id}`;
        document.getElementById('editProductId').value = product.id;
        document.getElementById('editName').value = product.name;
        document.getElementById('editCategoryId').value = product.category_id;
        document.getElementById('description').value = product.description;
        document.getElementById('editStatus').value = product.status;

        const sizePrices = { S: '', M: '', L: '', XL: '' };
        const sizeStocks = { S: '', M: '', L: '', XL: '' };

        if (product.sizes) {
            product.sizes.forEach(s => {
                sizePrices[s.size] = s.price;
                sizeStocks[s.size] = s.stock;
            });
        }

        ['S', 'M', 'L', 'XL'].forEach(size => {
            const priceInput = document.getElementById(`editSize_${size}_price`);
            const stockInput = document.getElementById(`editSize_${size}_stock`);
            if (priceInput) priceInput.value = sizePrices[size];
            if (stockInput) stockInput.value = sizeStocks[size];
        });        
    },
    closeEdit() {
        document.getElementById('editProductModal').classList.add('hidden');
    }
};

/** Global Helpers */
function reInitAOS() {
    setTimeout(() => AOS.init({ once: true, duration: 600 }), 100);
}

/** Optional: Close modals when clicking outside */
window.addEventListener('click', function (e) {
    const modals = ['addNewArrivalModal', 'editNewArrivalModal'];
    modals.forEach(id => {
        const modal = document.getElementById(id);
        if (modal && e.target === modal) {
            modal.classList.add('hidden');
        }
    });
});
