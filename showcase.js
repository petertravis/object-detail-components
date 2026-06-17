/* ── Showcase interactivity ─────────────────────────────────────────── */

// Collapsible FieldSection
document.querySelectorAll('.field-section__title').forEach(btn => {
  btn.addEventListener('click', () => {
    const section = btn.closest('.field-section');
    section.classList.toggle('field-section--collapsed');
    const expanded = !section.classList.contains('field-section--collapsed');
    btn.setAttribute('aria-expanded', expanded);
  });
});

// DetailPane open/close demo
document.querySelectorAll('[data-open-pane]').forEach(trigger => {
  trigger.addEventListener('click', () => {
    const id = trigger.dataset.openPane;
    document.getElementById(id)?.classList.add('detail-pane--open');
  });
});

document.querySelectorAll('[data-close-pane]').forEach(btn => {
  btn.addEventListener('click', () => {
    const id = btn.dataset.closePane;
    document.getElementById(id)?.classList.remove('detail-pane--open');
  });
});

// Smooth active-section highlighting in showcase nav
const sections = document.querySelectorAll('.sc-section');
const navLinks  = document.querySelectorAll('.sc-nav-link');

if (sections.length && navLinks.length) {
  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        navLinks.forEach(a => a.classList.remove('sc-nav-link--active'));
        const link = document.querySelector(`.sc-nav-link[href="#${entry.target.id}"]`);
        if (link) link.classList.add('sc-nav-link--active');
      }
    });
  }, { rootMargin: '-30% 0px -60% 0px' });

  sections.forEach(s => observer.observe(s));
}
