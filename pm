<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Growth PM — Ended (No Response / Email Bounced) — 2026-06-24</title>
<style>
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    font-size: 14px;
    background: #f5f5f5;
    color: #1a1a1a;
  }
  header {
    background: #fff;
    border-bottom: 1px solid #e0e0e0;
    padding: 16px 24px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: sticky;
    top: 0;
    z-index: 10;
  }
  header h1 { font-size: 16px; font-weight: 600; }
  header .meta { font-size: 12px; color: #666; margin-top: 2px; }
  .actions { display: flex; gap: 10px; align-items: center; }
  button {
    cursor: pointer; border: none; border-radius: 6px;
    font-size: 13px; font-weight: 500; padding: 8px 16px;
    transition: opacity 0.15s;
  }
  button:hover { opacity: 0.85; }
  .btn-primary { background: #0a66c2; color: #fff; }
  .btn-secondary { background: #e8e8e8; color: #333; }
  .popup-warning { font-size: 11px; color: #888; max-width: 220px; text-align: right; line-height: 1.4; }
  main { padding: 20px 24px; max-width: 1200px; margin: 0 auto; }
  table {
    width: 100%; border-collapse: collapse; background: #fff;
    border-radius: 8px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.08);
  }
  thead tr { background: #fafafa; border-bottom: 2px solid #e8e8e8; }
  th {
    padding: 10px 14px; text-align: left; font-size: 11px; font-weight: 600;
    text-transform: uppercase; letter-spacing: 0.05em; color: #555; white-space: nowrap;
  }
  td { padding: 12px 14px; vertical-align: middle; border-bottom: 1px solid #f0f0f0; line-height: 1.5; }
  tr:last-child td { border-bottom: none; }
  tr:hover td { background: #fafcff; }
  .col-name { width: 180px; font-weight: 500; }
  .col-linkedin { width: 50px; text-align: center; }
  .col-title { width: 260px; }
  .col-company { width: 170px; }
  .col-status { width: 150px; }
  .col-open { width: 60px; text-align: center; }
  a.li-link {
    display: inline-flex; align-items: center; justify-content: center;
    width: 30px; height: 30px; background: #0a66c2; border-radius: 6px;
    color: #fff; text-decoration: none; font-size: 12px; font-weight: 700;
  }
  a.li-link:hover { background: #004182; }
  .badge { display: inline-block; padding: 3px 8px; border-radius: 999px; font-size: 11px; font-weight: 600; white-space: nowrap; }
  .badge-noresp { background: #eef2ff; color: #3730a3; }
  .badge-bounced { background: #fef2f2; color: #b91c1c; }
  .row-num { color: #bbb; font-size: 12px; text-align: center; width: 32px; }
  .open-btn { background: #f0f0f0; color: #333; padding: 5px 10px; font-size: 12px; border-radius: 5px; }
</style>
</head>
<body>
<header>
  <div>
    <h1>Growth PM</h1>
  <div class="actions">
    <div class="popup-warning">Allow popups in your browser before clicking "Open all"</div>
    <button class="btn-secondary" onclick="exportCSV()">Export CSV</button>
    <button class="btn-primary" onclick="openAll()">Open all profiles ↗</button>
  </div>
</header>

<main>
<table id="profiles-table">
  <thead>
    <tr>
      <th class="row-num">#</th>
      <th class="col-name">Name</th>
      <th class="col-linkedin">LI</th>
      <th class="col-title">Title</th>
      <th class="col-company">Company</th>
      <th class="col-open"></th>
    </tr>
  </thead>
  <tbody id="tbody"></tbody>
</table>
</main>

<script>
const profiles = [
  {name:"Tom", surname:"Bennet", linkedin_url:"https://linkedin.com/in/tombennet", title:"Product Manager", company:"Synthesia", status:"Ended, Email Bounced"},
  {name:"Bence", surname:"Timár", linkedin_url:"https://linkedin.com/in/bencetimar", title:"Senior Product Owner", company:"Jimdo", status:"Ended, Email Bounced"},
  {name:"Matilde", surname:"Ricciardi", linkedin_url:"https://linkedin.com/in/matilde-ricciardi-26b390b", title:"Senior Product Manager", company:"Pleo", status:"Ended, No Response"},
  {name:"Courtney", surname:"Nagy", linkedin_url:"https://linkedin.com/in/courtannenagy", title:"Senior Product Manager, Growth", company:"Vimeo", status:"Ended, No Response"},
  {name:"Ieva", surname:"Desfeuillet", linkedin_url:"https://linkedin.com/in/ievades", title:"Senior Product Manager", company:"Qonto", status:"Ended, No Response"},
  {name:"Anna", surname:"Dzehilevych", linkedin_url:"https://linkedin.com/in/anna-dzehilevich", title:"Growth Mentor", company:"Growthmentor", status:"Ended, No Response"},
  {name:"Raul", surname:"Hanna", linkedin_url:"https://linkedin.com/in/raul-nacrur-hanna-9b2419b2", title:"Senior Growth Product Manager", company:"Taskhuman", status:"Ended, No Response"},
  {name:"Aaishwarya", surname:"Jain", linkedin_url:"https://linkedin.com/in/aaishwaryajain", title:"Senior Product Manager (Growth, AI)", company:"gotphoto.com | fotograf.de", status:"Ended, No Response"},
  {name:"Axel", surname:"Florence", linkedin_url:"https://linkedin.com/in/axelflorence", title:"Group Product Manager, Growth", company:"Flodesk", status:"Ended, No Response"},
  {name:"Richard", surname:"Stowey", linkedin_url:"https://linkedin.com/in/richardstowey", title:"Senior Growth Product Manager", company:"Productboard", status:"Ended, No Response"},
  {name:"Claudia", surname:"Pravettoni", linkedin_url:"https://linkedin.com/in/claudia-pravettoni-449a9313a", title:"Product Growth Lead", company:"Gorgias", status:"Ended, No Response"},
  {name:"Pelin", surname:"Yilmazbayir", linkedin_url:"https://linkedin.com/in/pelinyilmazbayir", title:"Senior Product Manager", company:"Pleo", status:"Ended, No Response"},
  {name:"Mariya", surname:"Popova", linkedin_url:"https://linkedin.com/in/popova-mariya", title:"Founder", company:"Mivia - Reflect to Connect", status:"Ended, No Response"},
  {name:"Sean", surname:"Barker", linkedin_url:"https://linkedin.com/in/sean-barker-0821b1b2", title:"Product Manager", company:"Depop", status:"Ended, No Response"},
  {name:"Samy", surname:"Ferjani", linkedin_url:"https://linkedin.com/in/samy-ferjani-481060a6", title:"Senior Product Manager", company:"Vestiaire Collective", status:"Ended, No Response"},
  {name:"Nina", surname:"Ge", linkedin_url:"https://linkedin.com/in/nina-ge-6397a692", title:"Senior Growth Product Manager", company:"Adobe", status:"Ended, No Response"},
  {name:"Guillaume", surname:"Hage", linkedin_url:"https://linkedin.com/in/guillaume-hage-19017aa5", title:"Head of Product - Growth", company:"Legalplace", status:"Ended, No Response"},
  {name:"Bennett", surname:"Reck", linkedin_url:"https://linkedin.com/in/bennett-reck-3939ba78", title:"Senior Product Manager", company:"Etsy", status:"Ended, No Response"},
  {name:"Yana", surname:"Dotsenko", linkedin_url:"https://linkedin.com/in/yanadotsenko", title:"Senior Product Manager, Growth", company:"Olx", status:"Ended, No Response"},
  {name:"Zehra", surname:"Yıldız-Schönfelder", linkedin_url:"https://www.linkedin.com/in/%C3%B6zge-y%C4%B1ld%C4%B1z/", title:"Senior Product Manager - Growth", company:"Qonto", status:"Ended, No Response"},
  {name:"Artur", surname:"Koter", linkedin_url:"https://linkedin.com/in/artur-koter-2088753a", title:"Senior Product Manager - Retention & Monetization", company:"Pleo", status:"Ended, No Response"},
  {name:"Tanmay", surname:"Jain", linkedin_url:"https://linkedin.com/in/tanmayjain-pm", title:"Growth", company:"Elevenlabs", status:"Ended, No Response"}
];

const esc = s => String(s||'').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
const tbody = document.getElementById('tbody');
profiles.forEach((p, i) => {
  const tr = document.createElement('tr');
  tr.innerHTML = `
    <td class="row-num">${i+1}</td>
    <td class="col-name">${esc(p.name)} ${esc(p.surname)}</td>
    <td class="col-linkedin"><a class="li-link" href="${p.linkedin_url}" target="_blank" title="Open LinkedIn profile">in</a></td>
    <td class="col-title">${esc(p.title)}</td>
    <td class="col-company">${esc(p.company)}</td>
    <td class="col-open"><button class="open-btn" onclick="window.open('${p.linkedin_url}','_blank')">Open</button></td>`;
  tbody.appendChild(tr);
});

function openAll() {
  profiles.map(p => p.linkedin_url).filter(Boolean)
    .forEach((url, i) => setTimeout(() => window.open(url, '_blank'), i * 100));
}

function exportCSV() {
  const cols = ["Name","Surname","Title","Company","LinkedIn Profile","Status"];
  const fields = ["name","surname","title","company","linkedin_url","status"];
  const escc = v => '"' + String(v||'').replace(/"/g,'""') + '"';
  const lines = [cols.map(escc).join(',')];
  profiles.forEach(p => lines.push(fields.map(f => escc(p[f])).join(',')));
  const blob = new Blob([lines.join('\n')], { type: 'text/csv' });
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = 'growth_pm_ended_no_response_bounced_2026-06-24.csv';
  a.click();
}
</script>
</body>
</html>
