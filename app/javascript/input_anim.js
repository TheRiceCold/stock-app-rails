export default(inputs) => {
  inputs.forEach(input => {
    const parent = input.parentNode.parentNode 

    input.onfocus = () =>
      parent.classList.add("focus")

    input.onblur = () => {
      if (!input.value) 
      parent.classList.remove("focus")
    }
  })
}
