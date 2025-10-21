<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Browse Available Rooms | Campus Hostel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Inter:400,600,700,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body {
      margin: 0;
      min-height: 100vh;
      background: linear-gradient(140deg, #fcfcfe 45%, #f5f5ff 100%), 
                  url('images/campushostel.jpg') center/cover no-repeat fixed;
      font-family: 'Inter', Arial, sans-serif;
    }
    .header-bar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1.4rem 2vw 1.1rem 2vw;
      background: #fff;
      box-shadow: 0 1.5px 20px #e5e5f25f;
      border-bottom: 1.5px solid #eceafd;
    }
    .header-brand {
      font-size: 2.05rem;
      font-weight: 800;
      color: #232150;
      display: flex;
      align-items: center;
      gap: 0.7rem;
    }
    .header-brand .bi {
      font-size: 2.1rem;
      background: #ece7fe;
      border-radius: 7px;
      color: #7367f0;
      padding: 0.18em;
      margin-right: 0.13em;
    }
    .header-links {
      display: flex;
      align-items: center;
      gap: 2rem;
    }
    .nav-btn {
      background: #7367f0;
      color: #fff;
      font-size: 1.16rem;
      font-weight: 600;
      padding: 0.75em 1.5em;
      border-radius: 13px;
      border: none;
      box-shadow: 0 3px 12px #d5cafd42;
      cursor: pointer;
      transition: background .16s;
      margin-right: 0.5rem;
    }
    .nav-btn:hover { background: #5541c9; }
    .navbar-link {
      font-weight: 600;
      color: #232150;
      text-decoration: none;
      font-size: 1.08rem;
      margin-right: 0.9em;
    }

    .page-title {
      font-size: 2.8rem;
      font-weight: 800;
      color: #232150;
      margin: 2.2rem 0 0.5rem 2vw;
      letter-spacing: -0.02em;
    }
    .subtitle {
      font-size: 1.17rem;
      color: #5a5a78;
      margin-left: 2vw;
      margin-bottom: 2.7rem;
    }
    .search-row {
      display: flex;
      gap: 1.1rem;
      margin: 2rem 2vw 0 2vw;
      align-items: center;
    }
    .search-box {
      flex: 2;
      display: flex;
      align-items: center;
      background: #f7f7fb;
      border-radius: 17px;
      padding: 1em 1.3em;
      font-size: 1.2rem;
      color: #656597;
      border: 1.5px solid #eceafd;
    }
    .search-box .bi {
      font-size: 1.4rem;
      margin-right: 0.7em;
      color: #a4a4d5;
    }
    .type-filter, .sort-filter {
      background: #f7f7fb;
      border-radius: 17px;
      padding: 1em 1.3em;
      font-size: 1.09rem;
      border: 1.5px solid #eceafd;
      color: #656597;
      cursor: pointer;
      min-width: 120px;
    }
    .rooms-grid {
      display: flex;
      gap: 2.2vw;
      margin: 2rem 2vw 0 2vw;
      flex-wrap: wrap;
      justify-content: flex-start;
    }
    .room-card {
      background: #fff;
      border-radius: 22px;
      width: 410px;
      max-width: 97vw;
      margin-bottom: 2.4rem;
      box-shadow: 0 2.5px 17px 2px #e6e9fd51;
      border: 1.3px solid #eceafd;
      display: flex;
      flex-direction: column;
      transition: box-shadow .13s;
      position: relative;
      overflow: hidden;
    }
    .room-card:hover {
      box-shadow: 0 8px 32px 0px #d6d2fd27;
      border-color: #7367f0;
    }
    .room-img {
      width: 100%; height: 220px; object-fit: cover; border-radius: 13px 13px 0 0; display: block;
      background: #ece7fe; /* Placeholder background */
    }
    .room-status {
      position: absolute; top: 10px; right: 18px;
      background: #28c76f;
      color: #fff;
      font-size: 1.01rem;
      font-weight: 700;
      border-radius: 9px;
      padding: 5px 13px;
      box-shadow: 0 2px 8px #28c76f22;
    }
    .card-content {
      padding: 1.65rem 2rem 1.5rem 2rem;
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }
    .room-title-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 2.2em;
      margin-bottom: 0.4em;
    }
    .room-title {
      font-size: 1.46rem;
      font-weight: 700;
      color: #232150;
      display: flex;
      align-items: center;
      gap: 0.7rem;
    }
    .room-title .bi {
      font-size: 1.3rem;
      color: #7367f0;
    }
    .room-price {
      font-size: 1.45rem;
      font-weight: 700;
      color: #7367f0;
      white-space: nowrap;
    }
    .room-meta {
      font-size: 1.09rem;
      color: #595976;
      margin-bottom: 0.23em;
    }
    .capacity {
      font-size: 1rem;
      font-weight: 600;
      color: #232150;
      margin-bottom: 0.23em;
      display: flex;
      align-items: center; gap: .65em;
    }
    .capacity .bi {
      opacity: 0.8; margin-right: 0.15em; font-size: 1.05rem;
    }
    .room-desc {
      color: #68758c;
      font-size: 1.06rem;
      margin-bottom: 0.5em;
    }
    .amenities {
      display: flex; gap: 0.6em; flex-wrap: wrap; margin-bottom: 1.2em;
    }
    .amenity-tag {
      background: #f1f3fc;
      border-radius: 9px;
      color: #232150;
      font-size: 0.98em;
      padding: 0.48em 1.05em;
      font-weight: 600;
      display: flex; align-items: center; gap: 0.21em;
    }
    .book-btn {
      background: #7367f0;
      color: #fff;
      width: 100%;
      border: none;
      border-radius: 11px;
      font-size: 1.23rem;
      font-weight: 700;
      padding: 0.83rem 0;
      margin-top: 1.1em;
      box-shadow: 0 2.5px 11px #d5cafd55;
      transition: background .13s;
      letter-spacing: 0.01em;
      font-family: 'Inter', Arial, sans-serif;
      cursor: pointer;
    }
    .book-btn:hover { background: #5541c9; }
    @media (max-width:1000px) { .rooms-grid{flex-direction:column;align-items:center;gap:1.2rem;} .room-card{width:96vw;} }
    @media (max-width:700px) { .header-bar{flex-direction:column;gap:1.2em;} .header-brand{font-size:1.1rem;} .rooms-grid{gap:0.7em;} }
  </style>
</head>
<body>
  <div class="header-bar">
    <span class="header-brand"><i class="bi bi-building"></i> Campus Hostel</span>
    <div class="header-links">
      <button class="nav-btn">Browse Rooms</button>
      <a href="booking.jsp" class="navbar-link">My Bookings</a>
    </div>
  </div>
  <div class="page-title">Browse Available Rooms</div>
  <div class="subtitle">Find your perfect accommodation from our 6 available rooms</div>
  <div class="search-row">
    <div class="search-box"><i class="bi bi-search"></i> Search by room number or type...</div>
    <select class="type-filter"><option>All Types</option><option>Single</option><option>Double</option><option>Triple</option></select>
  </div>

  
  <div class="rooms-grid">
  <!-- Floor 1 -->
  <div class="room-card">
    <img src="images/img1.0.jpg" alt="Room 101" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 101</span>
        <span class="room-price">₹30,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Single • Floor 1</div>
      <div class="capacity"><i class="bi bi-person"></i> Capacity: 2 person</div>
      <div class="room-desc">Cozy single room facing main street, modern amenities</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  
  <div class="room-card">
    <img src="images/img1.jpg" alt="Room 102" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 102</span>
        <span class="room-price">₹40,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Double • Floor 1</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 2 people</div>
      <div class="room-desc">Bright double room with access to balcony</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img2.jpg" alt="Room 103" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 103</span>
        <span class="room-price">₹45,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Triple • Floor 1</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 3 people</div>
      <div class="room-desc">Budget-friendly triple sharing room with city view</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img3.jpg" alt="Room 104" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 104</span>
        <span class="room-price">₹40,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Double • Floor 1</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 2 people</div>
      <div class="room-desc">Double room with private fridge, quiet zone</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img4.jpg" alt="Room 105" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 105</span>
        <span class="room-price">₹45,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Single • Floor 1</div>
      <div class="capacity"><i class="bi bi-person"></i> Capacity: 1 person</div>
      <div class="room-desc">Premium single room with attached bathroom, city view</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>

   <!-- Floor 2 -->
  <div class="room-card">
    <img src="images/img1.0.jpg" alt="Room 201" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 201</span>
        <span class="room-price">₹30,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Single • Floor 2</div>
      <div class="capacity"><i class="bi bi-person"></i> Capacity: 2 person</div>
      <div class="room-desc">Cozy single room facing main street, modern amenities</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>

  <div class="room-card">
    <img src="images/img1.jpg" alt="Room 202" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 202</span>
        <span class="room-price">₹40,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Double • Floor 2</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 2 people</div>
      <div class="room-desc">Bright double room with access to balcony</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img2.jpg" alt="Room 203" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 203</span>
        <span class="room-price">₹45,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Triple • Floor 2</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 3 people</div>
      <div class="room-desc">Budget-friendly triple sharing room with city view</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img3.jpg" alt="Room 204" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 204</span>
        <span class="room-price">₹40,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Double • Floor 2</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 2 people</div>
      <div class="room-desc">Double room with private fridge, quiet zone</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img4.jpg" alt="Room 205" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 205</span>
        <span class="room-price">₹45,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Single • Floor 2</div>
      <div class="capacity"><i class="bi bi-person"></i> Capacity: 1 person</div>
      <div class="room-desc">Premium single room with attached bathroom, city view</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div></div>

    <!-- Floor 3 -->
  <div class="room-card">
    <img src="images/img1.0.jpg" alt="Room 301" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 301</span>
        <span class="room-price">₹30,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Single • Floor 3</div>
      <div class="capacity"><i class="bi bi-person"></i> Capacity: 2 person</div>
      <div class="room-desc">Cozy single room facing main street, modern amenities</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img1.jpg" alt="Room 302" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 302</span>
        <span class="room-price">₹40,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Double • Floor 3</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 2 people</div>
      <div class="room-desc">Bright double room with access to balcony</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img2.jpg" alt="Room 303" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 303</span>
        <span class="room-price">₹45,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Triple • Floor 3</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 3 people</div>
      <div class="room-desc">Budget-friendly triple sharing room with city view</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img3.jpg" alt="Room 304" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 304</span>
        <span class="room-price">₹40,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Double • Floor 3</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 2 people</div>
      <div class="room-desc">Double room with private fridge, quiet zone</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img4.jpg" alt="Room 305" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 305</span>
        <span class="room-price">₹45,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Single • Floor 3</div>
      <div class="capacity"><i class="bi bi-person"></i> Capacity: 1 person</div>
      <div class="room-desc">Premium single room with attached bathroom, city view</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>

    <!-- Floor 4 -->
  <div class="room-card">
    <img src="images/img1.0.jpg" alt="Room 401" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 401</span>
        <span class="room-price">₹30,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Single • Floor 4</div>
      <div class="capacity"><i class="bi bi-person"></i> Capacity: 2 person</div>
      <div class="room-desc">Cozy single room facing main street, modern amenities</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img1.jpg" alt="Room 402" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 402</span>
        <span class="room-price">₹40,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Double • Floor 4</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 2 people</div>
      <div class="room-desc">Bright double room with access to balcony</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img2.jpg" alt="Room 403" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 403</span>
        <span class="room-price">₹45,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Triple • Floor 4</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 3 people</div>
      <div class="room-desc">Budget-friendly triple sharing room with city view</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img3.jpg" alt="Room 404" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 404</span>
        <span class="room-price">₹40,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Double • Floor 4</div>
      <div class="capacity"><i class="bi bi-people"></i> Capacity: 2 people</div>
      <div class="room-desc">Double room with private fridge, quiet zone</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>
  </div>
  <div class="room-card">
    <img src="images/img4.jpg" alt="Room 405" class="room-img" />
    <span class="room-status">Available</span>
    <div class="card-content">
      <div class="room-title-row">
        <span class="room-title"><i class="bi bi-building"></i> Room 405</span>
        <span class="room-price">₹45,000<br><span style="font-size:0.95em;font-weight:400;color:#6a6a8c;">per semester</span></span>
      </div>
      <div class="room-meta">Single • Floor 4</div>
      <div class="capacity"><i class="bi bi-person"></i> Capacity: 1 person</div>
      <div class="room-desc">Premium single room with attached bathroom, city view</div>
      <div class="amenities">
        <span class="amenity-tag"><i class="bi bi-wifi"></i> WiFi</span>
        <span class="amenity-tag"><i class="bi bi-snow"></i> AC</span>
        <span class="amenity-tag"><i class="bi bi-journal"></i> Study Desk</span>
        <span class="amenity-tag"><i class="bi bi-basket"></i> Wardrobe</span>
      </div>
      <button class="book-btn">Book Now</button>
    </div>



  </div>
</body>
</html>
