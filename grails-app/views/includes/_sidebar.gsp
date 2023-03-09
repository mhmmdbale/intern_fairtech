<div class="logo-box"><a href="#" class="logo-text">Polymorphic</a><a href="#" id="sidebar-close"><i class="material-icons">close</i></a> <a href="#" id="sidebar-state"><i class="material-icons">adjust</i><i class="material-icons compact-sidebar-icon">panorama_fish_eye</i></a></div>
<div class="page-sidebar-inner slimscroll">
    <ul class="accordion-menu">
        <li class="${request.forwardURI.startsWith('/dashboard') ? 'active-page' : ''}">
            <a href="/dashboard" class="${request.forwardURI.startsWith('/dashboard') ? 'active' : ''}"><i class="material-icons-outlined">dashboard</i>Dashboard</a>
        </li>
        <li class="${request.forwardURI.startsWith('/product') ? 'active-page' : ''}">
            <a href="/product" class="${request.forwardURI.startsWith('/product') ? 'active' : ''}"><i class="material-icons-outlined">checkroom</i>Product</a>
        </li>
        <li class="${request.forwardURI.startsWith('/order') ? 'active-page' : ''}">
            <a href="/profile.html" class="${request.forwardURI.startsWith('/order') ? 'active' : ''}"><i class="material-icons-outlined">receipt_long</i>Pesanan</a>
        </li>
        <li class="${request.forwardURI.startsWith('/reward') ? 'active-page' : ''}">
            <a href="file-manager.html" class="${request.forwardURI.startsWith('/reward') ? 'active' : ''}"><i class="material-icons">store</i>Reward Shop</a>
        </li>
        <li class="${request.forwardURI.startsWith('/finance') ? 'active-page' : ''}">
            <a href="calendar.html" class="${request.forwardURI.startsWith('/finance') ? 'active' : ''}"><i class="material-icons-outlined">account_balance</i>Keuangan</a>
        </li>
        <li class="${request.forwardURI.startsWith('/admin') ? 'active-page' : ''}">
            <a href="todo.html" class="${request.forwardURI.startsWith('/admin') ? 'active' : ''}"><i class="material-icons">person</i>User</a>
        </li>

    </ul>
</div>
</div>