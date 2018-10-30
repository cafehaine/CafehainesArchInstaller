document.addEventListener("DOMContentLoaded", init);

function init() {
	document.querySelectorAll("[data-require]").forEach(e=>{
		let id = e.attributes["data-require"].value;
		document.querySelector("#" + id).addEventListener("change", f=>{
			if (f.target.type == "checkbox")
			{
				e.disabled = ! f.target.checked;
			}
		});
	});
}
