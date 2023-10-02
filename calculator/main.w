// Import React and Wing
import * as React from "@winglang/react";
import * as Wing from "@winglang/wing";

// Define a function that renders the calculator UI using React components
function CalculatorUI(): React.Element {
  // Define some state variables to store the input values and the result
  const [num1, setNum1] = React.useState(0);
  const [num2, setNum2] = React.useState(0);
  const [op, setOp] = React.useState("+");
  const [result, setResult] = React.useState(0);

  // Define a function that handles the calculation logic using the Wing calculate function
  function handleCalculate() {
    try {
      // Call the Wing calculate function with the input values and the operator
      const res = Wing.calculate(num1, num2, op);
      // Set the result state variable to the returned value
      setResult(res);
    } catch (error) {
      // Handle any errors that may occur
      alert(error.message);
    }
  }

  // Return the JSX code that defines the UI elements
  return (
    <div className="calculator">
      <h1>Wing Calculator</h1>
      <div className="inputs">
        <input type="number" value={num1} onChange={(e) => setNum1(e.target.value)} />
        <select value={op} onChange={(e) => setOp(e.target.value)}>
          <option value="+">+</option>
          <option value="-">-</option>
          <option value="*">*</option>
          <option value="/">/</option>
        </select>
        <input type="number" value={num2} onChange={(e) => setNum2(e.target.value)} />
      </div>
      <div className="buttons">
        <button onClick={handleCalculate}>Calculate</button>
      </div>
      <div className="result">
        <p>The result is: {result}</p>
      </div>
    </div>
  );
}

// Export the CalculatorUI function as a default export
export default CalculatorUI;
